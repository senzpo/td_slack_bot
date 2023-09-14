# frozen_string_literal: true

class AddCreatedOnUpdatedOnToGitlabMergeRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :gitlab_merge_requests, :created_on, :datetime, null: false
    add_column :gitlab_merge_requests, :updated_on, :datetime, null: true
  end
end
