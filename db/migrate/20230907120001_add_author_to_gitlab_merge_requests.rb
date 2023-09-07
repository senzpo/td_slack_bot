class AddAuthorToGitlabMergeRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :gitlab_merge_requests, :author, :string
  end
end
