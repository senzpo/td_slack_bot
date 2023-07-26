# frozen_string_literal: true

class BitbucketPullRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :bitbucket_pull_requests do |t|
      t.integer :external_id, null: false, index: { unique: true }
      t.string :title, null: false
      t.string :state, null: false
      t.string :display_name, null: false
      t.datetime :created_on, null: false
      t.datetime :updated_on, null: true
      t.timestamps
    end
  end
end
