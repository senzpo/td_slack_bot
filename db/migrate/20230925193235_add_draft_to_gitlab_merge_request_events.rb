class AddDraftToGitlabMergeRequestEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :gitlab_merge_request_events, :draft, :boolean, default: false
  end
end
