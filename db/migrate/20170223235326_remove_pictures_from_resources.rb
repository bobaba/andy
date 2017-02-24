class RemovePicturesFromResources < ActiveRecord::Migration[5.0]
  def change
    remove_column :resources, :pictures, :string
  end
end
