class ChangeToysCategoriesToCategoriesToys < ActiveRecord::Migration[5.2]
  def change
    rename_table :toys_categories, :categories_toys
  end
end
