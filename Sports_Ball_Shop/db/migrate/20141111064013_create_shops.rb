class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :Type
      t.string :Brand
      t.integer :Price
      t.integer :Quantity
      t.integer :Sold
      t.timestamps
    end
  end
end
