class ChangePrecisionOnTotal < ActiveRecord::Migration
  def change
    change_column :orders, :total, :decimal, precision: 6, scale: 2
    change_column :orders, :subtotal, :decimal, precision: 6, scale: 2
  end
end
