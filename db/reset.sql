delete from recipes where recipe_id > 9;
select setval('recipes_recipe_id_seq', 9, true);

delete from ingredients where ingredient_id > 89;
select setval('ingredients_ingredient_id_seq', 89, true);

delete from nutrition_info where nutrition_id > 9;
select setval('nutrition_info_nutrition_id_seq', 9, true);

delete from steps where step_id > 9;
select setval('steps_step_id_seq', 9, true);

delete from recipe_media where media_id > 18;
select setval('recipe_media_media_id_seq', 18, true);