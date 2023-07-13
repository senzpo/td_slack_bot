# frozen_string_literal: true

module Gitlab
  class MergeRequest < ApplicationRecord
    self.table_name = "gitlab_merge_requests"
    validates :iid, presence: true, uniqueness: true
    validates :title, presence: true
    validates :project_id, presence: true
    validates :state, presence: true
  end
end
