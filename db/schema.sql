CREATE DATABASE recipes_app;

\c recipes_app;

CREATE TABLE recipes (
    recipes_id SERIAL PRIMARY KEY,
    recipes_name VARCHAR(500) NOT NULL,
    tag TEXT,
    ingredient_list TEXT[] NOT NULL,
    servings INTEGER NOT NULL,
    difficulty INTEGER NOT NULL,
    meal_type VARCHAR(500) NOT NULL,
    cuisine VARCHAR(500) NOT NULL,
    recipes_votes INTEGER NOT NULL DEFAULT 0,
    nutrition_info TEXT[],
    image_url_list TEXT[] NOT NULL,
    video_url_list TEXT,
    recipes_user_id_created INTEGER NOT NULL,
    recipes_created_at timestamptz DEFAULT now()
);


CREATE TABLE steps (
  steps_id SERIAL PRIMARY KEY,
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
  steps_recipe_id INTEGER NOT NULL,
  steps_created_at timestamptz DEFAULT now()
);

CREATE TABLE users (
  users_id SERIAL PRIMARY KEY,
  users_type VARCHAR(50) DEFAULT 'user', 
  users_name VARCHAR(500) NOT NULL,
  users_email VARCHAR(300) NOT NULL UNIQUE,
  password_digest VARCHAR(700) NOT NULL,
  users_recipe_saved_id INTEGER[],
  users_votes INTEGER NOT NULL DEFAULT 0,
  avatar_image_url TEXT, 
  users_created_at timestamptz DEFAULT now()
);

CREATE TABLE posts (
  posts_id SERIAL PRIMARY KEY,
  posts_recipe_id INTEGER NOT NULL,
  posts_user_id INTEGER NOT NULL,
  posts_votes INTEGER NOT NULL DEFAULT 0,
  posts_image_url TEXT,
  is_deleted INTEGER DEFAULT 0, 
  posts_created_at timestamptz DEFAULT now()
);


