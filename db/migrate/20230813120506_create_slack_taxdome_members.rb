class CreateSlackTaxdomeMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_taxdome_members do |t|

      t.string :external_id, null: false, index: { unique: true }
      t.string :real_name, null: false
      t.string :email, null: false
      t.string :role
      t.string :avatar_link
      t.boolean :deleted, null: false

      t.timestamps
    end
  end
end
