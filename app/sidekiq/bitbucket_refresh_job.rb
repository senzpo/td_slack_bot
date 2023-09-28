# frozen_string_literal: true

class BitbucketRefreshJob
  include Sidekiq::Job

  def perform
    BitbucketPullRequests::Refresh.perform
  rescue BitbucketPullRequests::Refresh::TaxdomeMemberDoesNotExist => e
    Rails.logger.debug e
  end
end
