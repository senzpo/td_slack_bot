# frozen_string_literal: true

class BitbucketPullRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :bitbucket_pull_requests, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :title, null: false
      t.integer :issues, null: false
      t.string :state, null: false
      t.string :author, null: false
      t.datetime :created_on, null: false
      t.datetime :updated_on, null: true
      t.timestamps
    end
  end
end
