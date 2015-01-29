require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  @title = "Recipe Book"
  erb(:index)
end

post("/add_recipe") do
  name = params.fetch("name")
  Recipe.create(name: name)
  redirect back
end

get("/edit_recipe/:id") do
  @title = "Edit Recipe"
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:edit_recipe)
end

post("/add_ingredient") do
  recipe_id = params.fetch("recipe_id").to_i
  text = params.fetch("text")
  Ingredient.create(recipe_id: recipe_id, text: text)
  redirect back
end

post("/add_instruction") do
  recipe_id = params.fetch("recipe_id").to_i
  text = params.fetch("text")
  number = params.fetch("number")
  Instruction.create(recipe_id: recipe_id, text: text, number: number)
  redirect back
end

patch("/edit_recipe_name") do
  name = params.fetch("name")
  recipe = Recipe.find(params.fetch("recipe_id"))
  recipe.update(name: name)
  redirect back
end
