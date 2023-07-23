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

    after_create :set_event
    after_update :check_state_change

    private

    def set_event
      Event.create(entity_id: self.id, entity: 'bitbucket', status: self.state, created_at: self.created_on)
    end

    def check_state_change
      if saved_change_to_state?
        Event.create(entity_id: self.id, entity: 'bitbucket', status: self.state, created_at: self.updated_on)
      end
    end
  end
end
