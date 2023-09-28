# frozen_string_literal: true

class SlackMembersRefreshJob
  include Sidekiq::Job

  def perform
    Slack::TaxdomeMembers::Refresh.perform
  end
end
