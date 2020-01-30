# a script to populate some dummy data in my app

require_relative 'shared'
require_relative '../models/dish'

create_user('dt@ga.co', 'pudding')

user = find_one_user_by_email('dt@ga.co')

title1 = ['pudding', 'cakey', 'ribs', 'smoky']
title2 = ['cake', 'cotton', 'muffin', 'pancakes']


20.times do
  create_dish("#{title1.sample} #{title2.sample}", '', user['id'])
end