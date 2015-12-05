class FixScrewUp < ActiveRecord::Migration
  def change
    remove_column :roles, :supplier, :string

  end
end
