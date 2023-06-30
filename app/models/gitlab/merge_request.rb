# frozen_string_literal: true

class Gitlab::MergeRequest < ApplicationRecord
  validates :iid, presence: true
  validates :title, presence: true, uniqueness: true
  validates :project_id, presence: true
  validates :state, presence: true
end
