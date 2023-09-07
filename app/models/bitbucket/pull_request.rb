# frozen_string_literal: true

module Bitbucket
  class PullRequest < ApplicationRecord
    self.table_name = 'bitbucket_pull_requests'
    validates :external_id, presence: true, uniqueness: true
    validates :title, presence: true
    validates :state, presence: true
    validates :display_name, presence: true
    validates :created_on, presence: true

    has_many :pull_request_events, dependent: :destroy, class_name: 'Bitbucket::PullRequestEvent', foreign_key: 'bitbucket_pull_request_id'

    belongs_to :taxdome_member, class_name: 'Slack::TaxdomeMember', foreign_key: 'slack_taxdome_member_id'
  end
end
