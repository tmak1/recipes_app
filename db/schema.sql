CREATE DATABASE recipes_app;

\c recipes_app;

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    tag TEXT,
    ingredient_list TEXT[] NOT NULL,
    servings INTEGER NOT NULL,
    difficulty INTEGER NOT NULL,
    meal_type VARCHAR(500) NOT NULL,
    cuisine VARCHAR(500) NOT NULL,
    likes INTEGER NOT NULL DEFAULT 0,
    nutrition_info TEXT[],
    image_url_list TEXT[] NOT NULL,
    video_url_list TEXT,
    user_id_created INTEGER NOT NULL,
    user_id_saved INTEGER[],
    created_at timestamptz DEFAULT now()
);


CREATE TABLE steps (
  id SERIAL PRIMARY KEY,
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
  recipe_id INTEGER NOT NULL,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  type VARCHAR(50) DEFAULT 'user', 
  name VARCHAR(500) NOT NULL,
  email VARCHAR(300) NOT NULL,
  password_digest VARCHAR(700) NOT NULL,
  recipe_saved_id INTEGER[],
  votes INTEGER NOT NULL DEFAULT 0,
  avatar_image_url TEXT, 
  created_at timestamptz DEFAULT now()
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  recipe_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  votes INTEGER NOT NULL DEFAULT 0,
  image_url TEXT,
  is_deleted INTEGER DEFAULT 0, 
  created_at timestamptz DEFAULT now()
);


