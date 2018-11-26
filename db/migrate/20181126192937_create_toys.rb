class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :materials
      t.integer :quantity
      t.integer :rating 

      t.timestamps
    end
  end
end
