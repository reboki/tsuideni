class AddAddressInfoToPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
    t.integer :customer_id
  end
  end
end
