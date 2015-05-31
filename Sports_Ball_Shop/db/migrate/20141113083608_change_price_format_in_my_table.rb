class ChangePriceFormatInMyTable < ActiveRecord::Migration
  def up
	change_column :shops, :Price, :decimal
  end

  def down
	change_column :shops, :Price, :integer
  end
end
