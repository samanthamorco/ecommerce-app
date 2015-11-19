class ChangeStockToBoolean < ActiveRecord::Migration
  def change
    change_column :products, :stock_info, :boolean, default: true
  end
end
