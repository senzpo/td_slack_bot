# frozen_string_literal: true

class CreateBitbucketPullRequestEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :bitbucket_pull_request_events do |t|
      t.references :bitbucket_pull_request, foreign_key: true, index: { name: 'fk_bitbucket_pull_request' }
      t.string :status, null: false
      t.datetime :produced_at, null: false
      t.timestamps
    end
  end
end
