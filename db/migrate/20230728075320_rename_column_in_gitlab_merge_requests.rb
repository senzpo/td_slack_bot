class RenameColumnInGitlabMergeRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :gitlab_merge_requests, :iid, :external_id
  end
end
