# frozen_string_literal: true

module Slack
  class TaxdomeMember < ApplicationRecord
    self.table_name = 'slack_taxdome_members'

    validates :external_id, presence: true, uniqueness: true
    validates :is_deleted, inclusion: [true, false]
    validates :real_name, presence: true
    validates :email, presence: true

    scope :by_display_name, ->(display_name) { where('real_name ILIKE (?)', display_name) }

    has_many :pull_requests, class_name: 'Bitbucket::PullRequest', foreign_key: 'slack_taxdome_member_id'
    has_many :merge_requests, class_name: 'Gitlab::MergeRequest', foreign_key: 'slack_taxdome_member_id'
  end
end
