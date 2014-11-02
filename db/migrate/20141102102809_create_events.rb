class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :event_thumb
      t.string :venue
      t.string :when_at
      t.integer :total_tickets
      t.integer :available_tickets
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :events, [:user_id, :created_at]
  end
end
