class CreateGitlabMergeRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :gitlab_merge_requests do |t|
      t.string :title, null: false
      t.integer :iid, null: false
      t.bigint :project_id, null: false
      t.string :state, null: false
      t.timestamps
    end
  end
end
