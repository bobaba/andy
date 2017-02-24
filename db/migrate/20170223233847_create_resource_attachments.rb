class CreateResourceAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_attachments do |t|
      t.integer :resource_id
      t.string :picture

      t.timestamps
    end
  end
end
