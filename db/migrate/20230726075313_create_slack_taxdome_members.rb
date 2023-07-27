# frozen_string_literal: true

class CreateSlackTaxdomeMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_taxdome_members, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :real_name, null: false
      t.string :email, null: false
      t.string :role, null: false
      t.string :team_id, null: false
      t.boolean :deleted, null: false
      t.timestamps
    end
  end
end
