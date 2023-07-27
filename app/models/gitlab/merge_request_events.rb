# frozen_string_literal: true

module Gitlab
  class MergeRequestEvent < ApplicationRecord
    self.table_name = 'gitlab_merge_request_events'
    validates :status, presence: true
    validates :produced_at, presence: true

    belongs_to :gitlab_merge_requests, foreign_key: 'gitlab_merge_request_id'
  end
end
