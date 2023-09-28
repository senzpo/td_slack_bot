# frozen_string_literal: true

require 'clockwork'
require 'active_support/time' # Allow numeric durations (eg: 1.minutes)
require_relative 'config/boot'
require_relative 'config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.hour, 'Refresh TD members') do
    SlackMembersRefreshJob.perform_async
  end

  every(1.hour, 'Refresh GitlabMergeRequests') do
    GitlabRefreshJob.perform_async
  end

  every(1.hour, 'Refresh BitbucketPullRequests') do
    BitbucketRefreshJob.perform_async
  end
end
