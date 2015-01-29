require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  erb(:index)
end

post("/add_recipe") do
  name = params.fetch("name")
  Recipe.create(name: name)
  redirect back
end

get("/edit_recipe/:id") do
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
