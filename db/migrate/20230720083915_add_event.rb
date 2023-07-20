class AddEvent < ActiveRecord::Migration[7.0]
  def change
    create_enum :status_type, ['gitlab', 'bitbucket']

    create_table :events do |t|
      t.integer :entity_id, null: false
      t.enum :entity, enum_type: 'status_type', null: false
      t.string :status, null: false
      t.datetime :created_at, null: false
    end
  end
end
