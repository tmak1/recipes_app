# Recipes App

App at:
https://recipesapprb.herokuapp.com/


### A recipe browsing and creating app made written in ruby and using sinatra</h3>


### Challenge
Create a CRUD app in ruby

### Solution

**A recipes app in ruby, sinatra and postgresql deployed in heroku.**

* Recipes are **listed** according to categories - Snack | Lunch | Dinner...

* Recipes are **searchable** either by their title/categories/tags that were attched when creating the recipe/cuisine

* Clicking on a recipe shows **details**, such as ingredients, preparation guide, calories breakdown etc

* A recipe can be **bookmarked** to the users list or it can be **upvoted (without refreshing the page)**

* To **create** a recipe user must be logged in (username: test@co.uk and password: 1)

* Once **logged** in users can visit their profile page to look at their meta info, create new recipes, 
look at the recipes they have created, look at the list of recipes create by other users that they have bookmarked and
comment on any recipe.

### Further fixes and features

* Fix new user signup
* Add ability to filter search results
* Auto complete from search keywords
* Listing by search keywords as suer types
* Ability to upvote comments
* Ability to add multiple images for a recipes when creating

