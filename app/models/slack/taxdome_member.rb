class Slack::TaxdomeMember < ApplicationRecord
  self.table_name = 'slack_taxdome_members'

  validates :external_id, presence: true, uniqueness: true
  validates :deleted, presence: true
  validates :real_name, presence: true
  validates :role, presence: true
  validates :email, presence: true
  validates :image_path, presence: true
end
