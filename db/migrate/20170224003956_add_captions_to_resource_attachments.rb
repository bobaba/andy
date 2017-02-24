class AddCaptionsToResourceAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :resource_attachments, :caption, :string
  end
end
