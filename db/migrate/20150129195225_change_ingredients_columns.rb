class ChangeIngredientsColumns < ActiveRecord::Migration
  def change
    remove_column :ingredients, :amount, :string
    remove_column :ingredients, :name, :string
    add_column :ingredients, :text, :string
  end
end
