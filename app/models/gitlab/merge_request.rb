# frozen_string_literal: true

module Gitlab
  class MergeRequest < ApplicationRecord
    self.table_name = "gitlab_merge_requests"
    validates :external_id, presence: true, uniqueness: true
    validates :title, presence: true
    validates :project_id, presence: true
    validates :state, presence: true
    validates :created_on, presence: true
    validates :updated_on, presence: true

    has_many :merge_request_events, dependent: :destroy, class_name: 'Gitlab::MergeRequestEvent', foreign_key: 'gitlab_merge_request_id'

    scope :ordered_by_newest, -> { order(created_on: :desc) }
  end
end
