class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :event_thumb
      t.string :venue
      #t.datetime :when_at
      t.integer :total_tickets
      t.integer :available_tickets
      t.references :user, index: true

      t.timestamps null: false
    end
    add_column(:events, :when_at, :datetime)
    add_index :events, [:user_id, :created_at]
  end
end
