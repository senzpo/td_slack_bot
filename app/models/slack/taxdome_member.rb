class Slack::TaxdomeMember < ApplicationRecord
  self.table_name = 'slack_taxdome_members'

  validates :external_id, presence: true, uniqueness: true
  validates :deleted, inclusion: [true, false]
  validates :real_name, presence: true
  validates :email, presence: true
end
