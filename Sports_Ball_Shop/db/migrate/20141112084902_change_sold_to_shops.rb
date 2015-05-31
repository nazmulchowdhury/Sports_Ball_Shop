class ChangeSoldToShops < ActiveRecord::Migration
  def up
	change_column :shops, :Sold, :integer, default: 0
  end

  def down
	change_column :shops, :Sold, :integer, default: 0
  end
end
