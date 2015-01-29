class CreateRecipesInstructionsIngredients < ActiveRecord::Migration
  def change

    create_table(:recipes) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:instructions) do |t|
      t.column(:recipe_id, :integer)
      t.column(:number, :integer)
      t.column(:text, :string)

      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:recipe_id, :integer)
      t.column(:name, :string)
      t.column(:amount, :string)

      t.timestamps
    end

  end
end
