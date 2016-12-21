class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :town
      t.float :price
      t.string :phone_number

      t.timestamps
    end
  end
end
