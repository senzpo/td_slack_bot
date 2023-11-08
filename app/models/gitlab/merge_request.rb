# frozen_string_literal: true

module Gitlab
  class MergeRequest < ApplicationRecord
    DRAFT_WORDS = %w[wip draft].freeze

    self.table_name = 'gitlab_merge_requests'
    validates :external_id, presence: true, uniqueness: true
    validates :title, presence: true
    validates :project_id, presence: true
    validates :author, presence: true
    validates :state, presence: true
    validates :created_on, presence: true
    validates :updated_on, presence: true

    has_many :merge_request_events, dependent: :destroy, class_name: 'Gitlab::MergeRequestEvent',
                                    foreign_key: 'gitlab_merge_request_id'

    scope :ordered_by_newest, -> { order(updated_on: :desc) }
    scope :ordered_by_oldest, -> { order(updated_on: :asc) }
    scope :opened, -> { where.not(state: %w[merged closed]) }
    belongs_to :taxdome_member, class_name: 'Slack::TaxdomeMember', foreign_key: 'slack_taxdome_member_id'

    def merged?
      state == 'merged'
    end

    def closed?
      state == 'closed'
    end

    def draft?
      !merged? && !closed? && DRAFT_WORDS.any? { |word| title.downcase.include?(word) }
    end

    def outdated?
      !merged? && !closed? && !draft? && updated_on < 3.days.ago
    end
  end
end
