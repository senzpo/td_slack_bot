# frozen_string_literal: true

require 'clockwork'
require 'active_support/time' # Allow numeric durations (eg: 1.minutes)
require_relative 'config/boot'
require_relative 'config/environment'

module Clockwork
  configure do |config|
    config[:tz] = 'UTC'
  end

  handler do |job|
    puts "Running #{job}"
  end

  every(1.hour, 'Refresh TD members') do
    Slack::TaxdomeMembers::Refresh.perform
  end

  every(1.hour, 'Refresh GitlabMergeRequests') do
    raw_merge_requests = GitlabHelper.get_merge_requests
    GitlabMergeRequests::Refresh.perform(raw_merge_requests)
  rescue GitlabMergeRequests::Refresh::TaxdomeMemberDoesNotExist => e
    # TODO: send some message
    puts e
  end

  every(1.hour, 'Refresh BitbucketPullRequests') do
    BitbucketPullRequests::Refresh.perform
  rescue BitbucketPullRequests::Refresh::TaxdomeMemberDoesNotExist => e
    # TODO: send some message
    puts e
  end

  every(1.week, 'Publish outdated Technical design', at: 'Tuesday 07:00') do
    Slack::Channels::PublishOutdatedTechnicalDesign.perform
  end

  every(1.day, 'Publish service team health', at: ['monday 07:00', 'tuesday 07:00', 'wednesday 07:00', 'thursday 07:00', 'friday 07:00']) do
    Slack::Channels::PublishServiceTeamHealth.perform
  end
end
