class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id,null: false
      t.string :place,       null: false
      t.string :section,     null: false
      t.integer :quantity,   null: false
      t.timestamps
    end
  end
end
