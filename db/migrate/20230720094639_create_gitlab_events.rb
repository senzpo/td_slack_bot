# frozen_string_literal: true

class CreateGitlabEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :gitlab_merge_request_events do |t|
      t.references :gitlab_merge_request, foreign_key: true, null: false
      t.string :status, null: false
      t.datetime :produced_at, null: false
      t.timestamps
    end
  end
end
