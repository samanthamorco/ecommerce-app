class AddStockInfo < ActiveRecord::Migration
  def change
    add_column :products, :stock_info, :string
  end
end
