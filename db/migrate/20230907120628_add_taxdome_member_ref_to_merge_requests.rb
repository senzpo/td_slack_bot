class AddTaxdomeMemberRefToMergeRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :gitlab_merge_requests, :slack_taxdome_member, foreign_key: true
  end
end
