class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :binomial
      t.string :common
      t.string :pictures
      t.text :description

      t.timestamps
    end
  end
end
