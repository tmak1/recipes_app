require 'sinatra'
require 'bcrypt'
require_relative 'db/shared'

if development?
  require 'sinatra/reloader'
  require 'pry'
end

enable :sessions



def logged_in?
  if session[:user_id]
    return true
  else
    return false
  end
end

def current_user
  if logged_in? 
    return run_sql("SELECT * FROM users WHERE user_id = #{session[:user_id]};")[0]
  end
end


get '/' do
  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE r.meal_type = 'snacks' AND m.media_type = 'image' ORDER BY recipe_vote DESC LIMIT 3;"
  snacks = run_sql(sql)

  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE r.meal_type = 'lunch' AND m.media_type = 'image' ORDER BY recipe_vote DESC LIMIT 3;"
  lunch = run_sql(sql)

  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE r.meal_type = 'dinner' AND m.media_type = 'image' ORDER BY recipe_vote DESC LIMIT 3;"
  dinner = run_sql(sql)

  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE r.meal_type = 'beverages' AND m.media_type = 'image' ORDER BY recipe_vote DESC LIMIT 3;"
  beverages = run_sql(sql)
  @all_recipes = {:snacks => snacks, :lunch => lunch, :dinner => dinner, :beverages => beverages};
  erb :index
end

get '/recipes/:id' do
  sql = "SELECT * FROM recipes r INNER JOIN steps s ON (r.recipe_id = s.step_recipe_id)" 
  sql += " INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id)" 
  sql += " INNER JOIN users u ON (r.recipe_user_created_id = u.user_id) WHERE r.recipe_id = #{params[:id]};"
  recipe = run_sql(sql)[0]

  sql = "SELECT * FROM ingredients WHERE ingredient_recipe_id = #{recipe['recipe_id']};"
  ingredient = run_sql(sql)
  
  sql = "SELECT * FROM nutrition_info WHERE nutrition_recipe_id = #{recipe['recipe_id']};"
  nutrition = run_sql(sql)[0]

  sql = "SELECT u.user_name, p.* FROM posts p INNER JOIN users u ON (p.post_user_id = u.user_id)"
  sql += " WHERE post_recipe_id = #{recipe['recipe_id']} ORDER by p.post_vote DESC;"
  posts = run_sql(sql)
  @data = {:recipe => recipe, :ingredient => ingredient ,:nutrition => nutrition, :posts => posts}
  # raise @recipe_details.inspect
  erb :"/recipes/show"
end

get '/recipes/:mealType/all' do
  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE r.meal_type = '#{params[:mealType]}' AND m.media_type = 'image' ORDER BY recipe_vote DESC;"
  @recipes = run_sql(sql)
  # raise @recipes.inspect
  erb :"/recipes/meal_type_show"
end

get '/search' do
  # need to set standard_conforming_strings=off; in psql
  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image' AND recipe_name ~* $1 UNION"
  sql += " SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image' AND tag ~* $1 UNION"
  sql += " SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image' AND meal_type ~* $1 UNION"
  sql += " SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image' AND cuisine ~* $1"
  sql += " ORDER BY recipe_vote DESC;"
  # raise sql.inspect
  str = "\\y#{params[:query]}\\y"
  @recipes = run_sql(sql, [str])
  erb :"/recipes/search_show"
end

get '/user/:id/recipes/create' do
  redirect '/login' unless logged_in? 
  erb :"recipes/create"
end

def recipe_insert()
  sql = "INSERT INTO recipes (recipe_name, tag, serving, difficulty,  meal_type, cuisine, recipe_user_created_id)"
  sql += " VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING recipe_id;"

  # raise sql.inspect

  recipe_result = run_sql(sql, [
    params[:recipe_name],
    params[:recipe_tag],
    params[:recipe_serving],
    params[:recipe_time],
    params[:recipe_meal_type],
    params[:recipe_cuisine],
    session[:user_id]
  ])
end

def ingredient_insert(recipe_result, i)
  sql = "INSERT INTO ingredients (ingredient_desc, ingredient_amount, ingredient_metric, ingredient_amount_other, ingredient_recipe_id)" 
  sql += " VALUES ($1, $2, $3, $4, $5);"

  ingred_result = run_sql(sql, [
    params["ingredient#{i}".to_sym],
    params["amount#{i}".to_sym],
    params["measure#{i}".to_sym],
    params["others#{i}".to_sym],
    recipe_result.first['recipe_id']
  ])
end
  

def steps_insert(recipe_result)
  sql = "INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step_recipe_id)"
  sql += " VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);"

    
  steps_result = run_sql(sql, [
    params[:step1] != nil ? params[:step1] : '',
    params[:step2] != nil ? params[:step2] : '',
    params[:step3] != nil ? params[:step3] : '',
    params[:step4] != nil ? params[:step4] : '',
    params[:step5] != nil ? params[:step5] : '',
    params[:step6] != nil ? params[:step6] : '',
    params[:step7] != nil ? params[:step7] : '',
    params[:step8] != nil ? params[:step8] : '',
    params[:step9] != nil ? params[:step9] : '',
    params[:step10] != nil ? params[:step10] : '',
    params[:step11] != nil ? params[:step11] : '',
    recipe_result.first['recipe_id']
  ])
end

def media_insert(recipe_result)
  sql = "INSERT INTO recipe_media (media_type, media_url, media_recipe_id)"
  sql += " VALUES ('image', $1, $2);"

  image_result = run_sql(sql, [
  params[:recipe_image_url],
  recipe_result.first['recipe_id']
  ])

end

def nutrition_info_insert(recipe_result)
  sql = "INSERT INTO nutrition_info (calorie, fat, carbs, fiber, sugar, protein, nutrition_recipe_id)"
  sql += " VALUES ($1, $2, $3, $4, $5, $6, $7);"

  nutrition_result = run_sql(sql, [
  params[:recipe_calorie],
  params[:recipe_fat],
  params[:recipe_carbs],
  params[:recipe_fiber],
  params[:recipe_sugar],
  params[:recipe_protein],
  recipe_result.first['recipe_id']
  ])
end

post '/recipes' do redirect '/login' unless logged_in?
  recipe_result = recipe_insert()
  i = 1
  params.keys.each do |key|
    if key.include? 'ingredient'
      ingredient_insert(recipe_result, i)
      i = i + 1
    end
  end
  steps_insert(recipe_result)
  media_insert(recipe_result)
  nutrition_info_insert(recipe_result)
redirect '/'
end

post '/recipe/like' do redirect '/login' unless logged_in?
  sql = "SELECT recipe_vote FROM recipes WHERE recipe_id = #{params[:recipe_id]};"
  # raise sql.inspect
  res = run_sql(sql, [])
  likes = res.first['recipe_vote'].to_i + 1
  sql = "UPDATE recipes SET recipe_vote = #{likes} WHERE recipe_id = #{params[:recipe_id]} RETURNING recipe_vote;"
  result = run_sql(sql, [])
  likes_count = result.first['recipe_vote'].to_json
end


get '/login' do
  erb :"/users/login"
end

get '/users/new/signup' do
  erb :"users/signup"
end

post '/login' do
  sql = "SELECT * FROM users WHERE user_email = $1;"
  results = run_sql(sql, [params[:email]])
  if results.count == 1 && BCrypt::Password.new(results.first['password_digest']) == params[:password]
      session[:user_id] = results[0]['user_id']
      redirect '/'
    else
      erb :login
    end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end


post '/signup' do
  sql = "SELECT * FROM users WHERE user_email = $1;"
  results = run_sql(sql, [params[:email]])
  # raise results.inspect
  @msg = ''
  if results.count > 0
    @msg = 'that email already exists'
    erb :"users/signup"
  else
    @msg = 'Signed up successfully. Please login'
    digested_password = BCrypt::Password.create(params[:password]); 
    sql = "INSERT INTO users (user_name, user_email, password_digest) VALUES ($1, $2, $3);"
    results = run_sql(sql, [params[:username], params[:email], digested_password])
    # raise sql.inspect
    erb :"users/login"
  end
end



get '/users/profile/:id' do
  redirect '/login' unless logged_in?
  redirect '/login' unless (params[:id] == session[:user_id])
  sql = "SELECT * FROM users u INNER JOIN recipes r ON (u.user_id = r.recipe_user_created_id)"
  sql += " INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image'"
  sql += " AND u.user_id = #{params[:id]};"
  user = run_sql(sql)

  sql = "SELECT user_recipe_saved_id FROM users WHERE user_id = #{params[:id]};"
  res = run_sql(sql)
  user_saved_recipe_ids = res.first['user_recipe_saved_id'].tr('{}', '').split(",")
  user_recipe_saved = []
  user_saved_recipe_ids.each do |n|
    sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id)"
    sql += " WHERE m.media_type = 'image' AND r.recipe_id = #{n}"
    recipe = run_sql(sql).first
    user_recipe_saved.push(recipe)
  end
  @data = { :user => user, :recipe => user_recipe_saved }
  erb :"users/profile"
end

get '/users/:id/recipes' do
  sql = "SELECT user_name FROM users WHERE user_id = #{params[:id]};"
  user = run_sql(sql).first
  sql = "SELECT * FROM recipes r INNER JOIN recipe_media m ON (r.recipe_id = m.media_recipe_id) WHERE m.media_type = 'image'"
  sql += " AND r.recipe_user_created_id = #{params[:id]};"
  created_recipes = run_sql(sql)
  @data = { :user => user, :created_recipes => created_recipes }
  erb :"recipes/user_recipes" 
end

post '/user/recipesave' do
  redirect '/login' unless logged_in?
  redirect '/login' unless (params[:user_id] == session[:user_id])

  sql = "SELECT user_recipe_saved_id FROM users WHERE user_id = #{params[:user_id]};"
  res = run_sql(sql, [])
  user_saved_recipe = res.first['user_recipe_saved_id'].tr('{}', '').split(",")
  recipe_id = params[:recipe_id]
  if user_saved_recipe.include? recipe_id 
    user_saved_recipe.delete(recipe_id)
  else
    user_saved_recipe.push(recipe_id)
  end
  updated_saved = '{' + user_saved_recipe.uniq.join(",") + '}'
  sql = "UPDATE users SET user_recipe_saved_id = '#{updated_saved}' WHERE user_id = #{params[:user_id]} RETURNING user_recipe_saved_id;"
  result = run_sql(sql)
  saved_recipes = result.first['user_recipe_saved_id'].tr('{}', '').split(",")
end

post '/comment' do
  redirect '/login' unless logged_in?
  redirect '/login' unless (params[:user_id] == session[:user_id])

  sql = "INSERT INTO posts (post_text, post_recipe_id, post_user_id)"
  sql += " VALUES ($1, $2, $3) RETURNING *;"
  res = run_sql(sql, [
    params[:post_text],
    params[:recipe_id],
    params[:user_id]
  ])
  sql = "SELECT user_name FROM users WHERE user_id = #{res.first['post_user_id']}"
  result = run_sql(sql)
  rf = res.first
  rs = result.first
  rf['user_name'] = rs['user_name']
  return rf.to_json
end


  # def ingredBuilder(params)
  #   ing = "{"
  
  #   5.times do |n|
  #     ingred = ("ingredient" + (n + 1).to_s).to_sym
  #     ingred_nxt = ("ingredient" + (n + 2).to_s).to_sym
  
  #     amounta = ("amount" + (n + 1).to_s + "a").to_sym
  #     measurea = ("measure" + (n + 1).to_s + "a").to_sym
  
  #     amountb = ("amount" + (n + 1).to_s + "b").to_sym
  #     measureb = ("measure" + (n + 1).to_s + "b").to_sym
  
  #     amountc = ("amount" + (n + 1).to_s + "c").to_sym
  #     measurec = ("measure" + (n + 1).to_s + "c").to_sym
  
  #     # pip += ingreda.to_s + amounta.to_s + measurea.to_s + amountb.to_s + measureb.to_s + amountc.to_s + measurec.to_s
      
  #     if params[ingred].strip.chomp != ""
  #       ing += ""#{params[ingred]}:"
  #       if params[amounta].strip.chomp != ""
  #         ing +=f params[measurea] == "to taste"
  #         ing += " #{params[measurea]}"
  #       end
  #       if params[amountb].strip.chomp != ""
  #         ing += " (#{params[amountb]}"
  #         if params[measureb] != ""
  #           ing += " #{params[measureb]})"
  #         end
  #       end
  #       if params[amountc].strip.chomp != ""
  #         ing += " (#{params[amountc]}"
  #         if params[measurec] != ""
  #           ing += " #{params[measurec]})"
  #         end
  #       end
  #       if params[ingred_nxt].strip.chomp != ""
  #         ing += "\","
  #       else 
  #         ing += "\""
  #       end        
  #     end
    
  #   end
  #   ing += "}"
  
  #   return ing
  # end