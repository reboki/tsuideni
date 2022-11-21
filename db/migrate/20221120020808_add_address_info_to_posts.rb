class AddAddressInfoToPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
    t.string :address
    t.float :latitude
    t.float :longitude
  end
  end
end
