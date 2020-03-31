require 'pg'

def run_sql(sql, args = [])
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'recipeapp'})
  results = conn.exec_params(sql, args)
  conn.close
  results
end
