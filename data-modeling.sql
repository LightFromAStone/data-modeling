CREATE TABLE users (
   user_id SERIAL PRIMARY KEY,
   user_name VARCHAR(50) NOT NULL,
   user_email VARCHAR(50) NOT NULL,
   user_password VARCHAR(500) NOT NULL,
   account_created TIMESTAMP NOT NULL
);

CREATE TABLE recipes (
 recipe_id SERIAL PRIMARY KEY,
 recipe_name VARCHAR(50) NOT NULL,
 recipe_author INT NOT NULL REFERENCES users(user_id),
 recipe_instructions VARCHAR(10000) NOT NULL
);

CREATE TABLE ingredients (
   ingredient_id SERIAL PRIMARY KEY,
   ingredient_name VARCHAR(50)
);

CREATE TABLE recipe_ingredient (
   recipe_ingredient_id SERIAL PRIMARY KEY,
   ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
   ingredient_quantity VARCHAR(50) NOT NULL,
   recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE groceries (
   grocery_id SERIAL PRIMARY KEY,
   user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE grocery_ingredients (
   grocery_ingredient_id SERIAL PRIMARY KEY,
   ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
   ingredient_quantity VARCHAR(50) NOT NULL,
   grocery_id INT NOT NULL REFERENCES groceries(grocery_id)
);

CREATE TABLE occasions (
   occasion_id SERIAL PRIMARY KEY,
   occasion_name VARCHAR(100),
   user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occasion_recipes (
   occasion_recipe_id SERIAL PRIMARY KEY,
   occasion_id INT NOT NULL REFERENCES occasions(occasion_id),
   recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);