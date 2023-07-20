# frozen_string_literal: true

module Bitbucket
  class PullRequest < ApplicationRecord
    self.table_name = 'bitbucket_pull_requests'
    validates :id, presence: true
    validates :title, presence: true
    validates :issues, presence: true
    validates :state, presence: true
    validates :author, presence: true
    validates :created_on, presence: true
  end
end
