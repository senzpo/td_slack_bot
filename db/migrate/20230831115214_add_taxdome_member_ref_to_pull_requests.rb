class AddTaxdomeMemberRefToPullRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :bitbucket_pull_requests, :slack_taxdome_member, foreign_key: true
  end
end
