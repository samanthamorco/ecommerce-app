class AddSupplierRoleToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :supplier, :string
  end
end
