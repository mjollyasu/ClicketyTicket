class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.integer :tickets_purchased

      t.timestamps null: false
    end
  end
end
