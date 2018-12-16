class ToysCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :toys_categories, :id => false do |t|
      t.references :categories 
      t.references :toys 
    end
  end
end
