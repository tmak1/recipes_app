require 'pg'

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'recipes_app'})
  results = conn.exec_params(sql)
  conn.close
  results
end
