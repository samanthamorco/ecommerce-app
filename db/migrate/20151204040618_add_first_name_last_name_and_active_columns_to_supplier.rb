class AddFirstNameLastNameAndActiveColumnsToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :first_name, :string
    add_column :suppliers, :last_name, :string
    add_column :suppliers, :active, :boolean, default: true
  end
end
