class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :quantity
      t.integer :rating 
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
