# frozen_string_literal: true

module Slack
  class TaxdomeMember < ApplicationRecord
    validates :id, presence: true, uniqueness: true
    validates :real_name, presence: true
    validates :email, presence: true
    validates :role, presence: true
    validates :team_id, presence: true
    validates :deleted, presence: true
  end
end
