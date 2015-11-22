class RemoveExtraImages < ActiveRecord::Migration
  def change
    remove_column :images, :image2, :string
    remove_column :images, :image3, :string
    rename_column :images, :image1, :image_url
  end
end
