# frozen_string_literal: true

module Bitbucket
  class PullRequestEvent < ApplicationRecord
    self.table_name = 'bitbucket_pull_request_events'
    validates :status, presence: true
    validates :produced_at, presence: true

    belongs_to :pull_request, class_name: 'Bitbucket::PullRequest', foreign_key: 'bitbucket_pull_request_id'
  end
end
