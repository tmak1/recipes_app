require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'db/shared'


get '/' do
  sql = "SELECT * FROM recipes WHERE meal_type = 'snacks' ORDER BY likes LIMIT 3;"
  snacks = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'lunch' ORDER BY likes LIMIT 3;"
  lunch = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'dinner' ORDER BY likes LIMIT 3;"
  dinner = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'beverages' ORDER BY likes LIMIT 3;"
  beverages = run_sql(sql)

  @all_recipes = {:snacks => snacks, :lunch => lunch, :dinner => dinner, :beverages => beverages};

  erb :index
end

get '/recipes/:id' do
  sql = "SELECT * FROM recipes WHERE id = #{params[:id]};"
  @recipe = run_sql(sql)[0]
  # raise @recipe.inspect
  erb :"/recipes/show"
end







