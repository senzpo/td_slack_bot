# frozen_string_literal: true

class Slack::TaxdomeMember < ApplicationRecord
  self.table_name = 'slack_taxdome_members'
  validates :external_id, presence: true, uniqueness: true
  validates :real_name, presence: true
  validates :email, presence: true ???
  validates :role, presence: true
  validates :deleted, presence: true
  # image_original
end
