class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.integer :phone

      t.timestamps null: false
    end
  end
end
