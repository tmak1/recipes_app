require 'sinatra'
require 'bcrypt'
require_relative 'db/shared'

if development?
  require 'sinatra/reloader'
  require 'pry'
end

enable :sessions

def ingredBuilder(params)
  ing = "{"

  5.times do |n|
    ingred = ("ingredient" + (n + 1).to_s).to_sym
    ingred_nxt = ("ingredient" + (n + 2).to_s).to_sym

    amounta = ("amount" + (n + 1).to_s + "a").to_sym
    measurea = ("measure" + (n + 1).to_s + "a").to_sym

    amountb = ("amount" + (n + 1).to_s + "b").to_sym
    measureb = ("measure" + (n + 1).to_s + "b").to_sym

    amountc = ("amount" + (n + 1).to_s + "c").to_sym
    measurec = ("measure" + (n + 1).to_s + "c").to_sym

    # pip += ingreda.to_s + amounta.to_s + measurea.to_s + amountb.to_s + measureb.to_s + amountc.to_s + measurec.to_s
    
    if params[ingred].strip.chomp != ""
      ing += ""#{params[ingred]}:"
      if params[amounta].strip.chomp != ""
        ing +=f params[measurea] == "to taste"
        ing += " #{params[measurea]}"
      end
      if params[amountb].strip.chomp != ""
        ing += " (#{params[amountb]}"
        if params[measureb] != ""
          ing += " #{params[measureb]})"
        end
      end
      if params[amountc].strip.chomp != ""
        ing += " (#{params[amountc]}"
        if params[measurec] != ""
          ing += " #{params[measurec]})"
        end
      end
      if params[ingred_nxt].strip.chomp != ""
        ing += "\","
      else 
        ing += "\""
      end        
    end
  
  end
  ing += "}"

  return ing
end

def logged_in?
  if session[:user_id]
    return true
  else
    return false
  end
end

def current_user 
  return run_sql("SELECT * FROM users WHERE users_id = #{session[:user_id]};")[0]
end


get '/' do
  sql = "SELECT * FROM recipes WHERE meal_type = 'snacks' ORDER BY recipes_votes LIMIT 3;"
  snacks = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'lunch' ORDER BY recipes_votes LIMIT 3;"
  lunch = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'dinner' ORDER BY recipes_votes LIMIT 3;"
  dinner = run_sql(sql)

  sql = "SELECT * FROM recipes WHERE meal_type = 'beverages' ORDER BY recipes_votes LIMIT 3;"
  beverages = run_sql(sql)

  @all_recipes = {:snacks => snacks, :lunch => lunch, :dinner => dinner, :beverages => beverages};

  erb :index
end

get '/recipes/:id' do
  sql = "SELECT * FROM recipes r INNER JOIN steps s ON (r.recipes_id = s.steps_recipe_id) INNER JOIN users u ON (r.recipes_user_id_created = u.users_id) WHERE r.recipes_id = #{params[:id]};"
  @recipe = run_sql(sql)[0]
  # raise @recipe.inspect
  erb :"/recipes/show"
end

get '/recipes/:mealType/all' do
  sql = "SELECT * FROM recipes WHERE meal_type = '#{params[:mealType]}' ORDER BY recipes_votes;"
  @recipes = run_sql(sql)
  # raise @recipes.inspect
  erb :"/recipes/meal_type_show"
end

get '/search' do
  # need to set standard_conforming_strings=off; in psql
  sql = "SELECT * FROM   recipes WHERE recipes_name  ~* $1 UNION"
  sql += " SELECT * FROM recipes WHERE tag ~* $1 UNION"
  sql += " SELECT * FROM recipes WHERE meal_type ~* $1 UNION"
  sql += " SELECT * FROM recipes WHERE cuisine ~* $1"
  sql += " ORDER BY recipes_votes;"
  # raise sql.inspect
  str = "\\y#{params[:query]}\\y"
  @recipes = run_sql(sql, [str])
  erb :"/recipes/search_show"
end

get '/user/:id/recipes/create' do
  redirect '/login' unless logged_in? 
  erb :"recipes/create"
end

post '/recipes' do
  redirect '/login' unless logged_in?
  ing = ingredBuilder params
  stp1 = params[:step1].strip! 
  stp2 = params[:step2].strip!  
  stp3 = params[:step3].strip!  
  stp4 = params[:step4].strip!  
  stp5 = params[:step5].strip!  

  
sql = "INSERT INTO recipes (recipes_name, tag, ingredient_list, servings, difficulty,  meal_type,  cuisine, image_url_list, recipes_user_id_created)"
sql += "VALUES ('#{params[:recipes_name]}', '#{params[:recipes_tag]}', '#{ing}', #{params[:recipes_servings]}, '#{params[:recipes_time]},"
sql += "'#{params[:recipes_meal_type]}', '#{params[:recipes_cuisine]}', '{#{params[:recipes_image_url]}}',"
sql += "#{session[:user_id]};"

# result = run_sql(sql)

raise sql.inspect









  # create_dish(params[:name], params[:image_url], current_user['id'])
  redirect '/'
end

get '/login' do
  erb :"/users/login"
end

get '/users/new/signup' do
  erb :"users/signup"
end

post '/login' do
  sql = "SELECT * FROM users WHERE users_email = $1;"
  results = run_sql(sql, [params[:email]])
  if results.count == 1 && BCrypt::Password.new(results.first['password_digest']) == params[:password]
      session[:user_id] = results[0]['users_id']
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
  sql = "SELECT * FROM users WHERE users_email = $1;"
  results = run_sql(sql, [params[:email]])
  # raise results.inspect
  @msg = ''
  if results.count > 0
    @msg = 'that email already exists'
    erb :"users/signup"
  else
    @msg = 'Signed up successfully. Please login'
    digested_password = BCrypt::Password.create(params[:password]); 
    sql = "INSERT INTO users (users_name, users_email, password_digest) VALUES ($1, $2, $3);"
    results = run_sql(sql, [params[:username], params[:email], digested_password])
    # raise sql.inspect
    erb :"users/login"
  end
end


get '/users/profile/:id' do
  redirect '/login' unless logged_in?
  redirect '/login' unless (params[:id] == session[:user_id])
  sql = "SELECT * FROM users u INNER JOIN recipes r ON (u.users_id = r.recipes_user_id_created) WHERE u.users_id = #{params[:id]};"
  @user = run_sql(sql)
  # raise @user[0].inspect

  sql1 = "SELECT * FROM users u INNER JOIN recipes r ON (u.users_id = r.recipes_user_id_created) WHERE u.users_id = #{params[:id]};"
  @user = run_sql(sql)
  # raise @user[0].inspect
  erb :"users/profile"
end












