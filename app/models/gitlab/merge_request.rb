# frozen_string_literal: true

module Gitlab
  class MergeRequest < ApplicationRecord
    validates :iid, presence: true
    validates :title, presence: true, uniqueness: true
    validates :project_id, presence: true
    validates :state, presence: true
  end
end
