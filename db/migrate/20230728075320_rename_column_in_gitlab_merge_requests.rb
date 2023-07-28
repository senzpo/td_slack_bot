class RenameColumnInGitlabMergeRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :gitlab_merge_requests, :iid, :external_id

    add_index :gitlab_merge_requests, :external_id, unique: true
  end
end
