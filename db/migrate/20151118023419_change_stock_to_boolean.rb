class ChangeStockToBoolean < ActiveRecord::Migration
  def change
    change_column :products, :stock_info, 'boolean USING (trim(stock_info)::boolean)', default: true
  end
end
