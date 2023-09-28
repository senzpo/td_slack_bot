# frozen_string_literal: true

class GitlabRefreshJob
  include Sidekiq::Job

  def perform
    raw_merge_requests = GitlabHelper.get_merge_requests
    GitlabMergeRequests::Refresh.perform(raw_merge_requests)
  rescue GitlabMergeRequests::Refresh::TaxdomeMemberDoesNotExist => e
    # TODO: send some message
    Rails.logger.debug e
  end
end
