class AddRotateToResourceAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :resource_attachments, :rotate, :integer
  end
end
