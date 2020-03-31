CREATE DATABASE recipeapp;

\c recipesapp;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_type VARCHAR(50) DEFAULT 'user', 
  user_name VARCHAR(500) NOT NULL,
  user_email VARCHAR(300) NOT NULL UNIQUE,
  password_digest VARCHAR(700) NOT NULL,
  user_vote INTEGER NOT NULL DEFAULT 0,
  avatar_image_url TEXT, 
  user_recipe_saved_id INTEGER[],
  user_created_at timestamptz DEFAULT now()
);

CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    recipe_name VARCHAR(500) NOT NULL,
    tag TEXT,
    serving INTEGER NOT NULL,
    difficulty INTEGER NOT NULL,
    meal_type VARCHAR(500) NOT NULL,
    cuisine VARCHAR(500) NOT NULL,
    recipe_vote INTEGER NOT NULL DEFAULT 0,
    recipe_user_created_id INTEGER NOT NULL,
    recipe_created_at timestamptz DEFAULT now()
);


CREATE TABLE steps (
  step_id SERIAL PRIMARY KEY,
  step1 VARCHAR(1000) NOT NULL,
  step2 VARCHAR(1000),
  step3 VARCHAR(1000),
  step4 VARCHAR(1000),
  step5 VARCHAR(1000),
  step6 VARCHAR(1000),
  step7 VARCHAR(1000),
  step8 VARCHAR(1000),
  step9 VARCHAR(1000),
  step10 VARCHAR(1000),
  step11 VARCHAR(1000),
  step_recipe_id INTEGER NOT NULL,
  step_created_at timestamptz DEFAULT now()
);


CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  post_text TEXT NOT NULl,
  post_recipe_id INTEGER NOT NULL,
  post_user_id INTEGER NOT NULL,
  post_vote INTEGER NOT NULL DEFAULT 0,
  post_image_url TEXT,
  is_deleted INTEGER DEFAULT 0, 
  post_created_at timestamptz DEFAULT now()
);

CREATE TABLE recipe_media (
    media_id SERIAL PRIMARY KEY,
    media_type VARCHAR(50),
    media_url TEXT,
    media_recipe_id INTEGER NOT NULL,
    media_created_at timestamptz DEFAULT now()
);


CREATE TABLE nutrition_info (
    nutrition_id SERIAL PRIMARY KEY,
    calorie NUMERIC, 
    fat NUMERIC,
    carbs NUMERIC,
    fiber NUMERIC,
    sugar NUMERIC,
    protein NUMERIC,
    nutrition_recipe_id INTEGER NOT NULL,
    nutrition_created_at timestamptz DEFAULT now()
);

CREATE TABLE ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_desc VARCHAR(200),
    ingredient_amount VARCHAR(50),
    ingredient_metric VARCHAR(50),
    ingredient_amount_other VARCHAR(50),
    ingredient_recipe_id INTEGER NOT NULL,
    ingredient_created_at timestamptz DEFAULT now()
);

