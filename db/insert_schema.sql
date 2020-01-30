SELECT * INTO  temp FROM recipes;

ALTER TABLE temp DROP COLUMN image_url_list;
ALTER TABLE temp DROP video_url_list;

SELECT * FROM temp; 

DROP TABLE temp;






INSERT INTO users (
  name, 
  email,
  password_digest,
  avatar_image_url
)
VALUES (
    'John',
    'dt1@ga.co.uk',
    '1',
    '');

INSERT INTO users (
  name, 
  email,
  password_digest,
  avatar_image_url
)
VALUES (
    'Jane',
    'dt2@ga.co.uk',
    '2',
    ''
);

INSERT INTO users (
  name,
  type, 
  email,
  password_digest,
  avatar_image_url
)
VALUES (
    'DT',
    'admin',
    'admin@ga.co.uk',
    '3',
    ''
);



INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'In a bowl, mix the tuna, mayonnaise, mustard, salt, and pepper. Set aside.',
    'Slice a cucumber into 4 sections. Use a melon baller to hollow out the center, not quite through to the bottom. Fill each cucumber with tuna mixture, and top with half of a cherry tomato.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    1
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Preheat oven to 400˚F (200˚C).',
    'On a baking sheet, season salmon with garlic, olive oil, salt, pepper, and paprika.',
    'Bake for 10-12 minutes.',
    'In a small bowl, mix avocado topping ingredients until fully incorporated. Don’t overmix or you’ll break down your avocado.',
    'Spoon avocado topping over the salmon.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    '',
    2
);


INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Preheat oven to 400°F (200°C).',
    'Add the asparagus onto a baking tray and coat with olive oil, salt, pepper, and garlic.',
    'Place salmon fillets in the middle of the baking tray.',
    'In a small bowl, add the olive oil, honey, and garlic. Mix until well combined. Coat salmon with mixture.',
    'Bake for 12-15 minutes.',
    'Serve now or refrigerate in airtight container up to 3-4 days.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    3
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Bring a large pot of salted water to a boil. Cook the pasta according to package instructions. Drain.',
    'Add the olive oil, garlic, and chile flakes to a large sauté pan. Turn the heat to medium-low and slowly heat up until the garlic is fragrant and lightly colored, about 3 minutes.',
    'Add the oregano, capers, olives, tomato paste, and diced tomatoes. Bring the sauce to a simmer and cook for 8-10 minutes, stirring occasionally.',
    'Add the tuna and cook for another minute.',
    'Toss in the cooked pasta.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    '',
    4
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'In a large pot over medium heat, melt together 2 tablespoons of butter and 2 tablespoons of olive oil. Add the carrot, leek, onion, red bell pepper, fennel, green bell pepper, celery, and garlic. Season with salt and pepper. Stir and cook until the vegetables are softened, about 15 minutes.
Scoop half of the matignon (sautéed minced vegetables) from the pan and set aside. Stir the tomato paste, basil, oregano, thyme, and cayenne into the remaining vegetables and cook until the tomato paste starts to brown, about 10 minutes.',
    'Next, add half of the white wine to deglaze the pan, stirring to loosen any bits stuck to the bottom of the pot.
Add the fish stock, crushed tomatoes, and bay leaves. Stir together, bring to a boil, then reduce the heat to low, cover, and simmer for 30 minutes.',
    'In a large skillet, heat 2 tablespoons of olive oil over medium-high heat. Season all of the seafood with salt and pepper.',
'Add the scallops to the pan and sear the first side until golden brown, 3 minutes. Flip and sear on the other side for another 3 minutes. Remove from the pan and set aside. Wipe out the pan if needed.
Add more olive oil as needed, then add the shrimp to the pan and cook for 3 minutes on one side. Flip and cook on the other side for 3 minutes more. Set aside.',
    'Add more olive oil and the squid to the hot pan and sauté until cooked, 5 minutes.
Add more olive oil and the halibut to the hot pan, along with the crushed garlic and remaining 2 tablespoons of butter. Sear the halibut on one side, then flip and cook on the other side for 3 minutes. Baste the fish with the melted garlic butter as the second side cooks. Remove from the pan and set aside.
Add the clams and mussels to the pan, pour in the remaining cup of white white, then cover the pot and steam for 5 minutes, until the shellfish pop open. Remove the pan from the heat.',
    'Transfer all of the cooked seafood, along with the leftover shellfish steaming liquid and reserved matignon, to the simmering stew; or plate the seafood and reserved matignon artfully in wide bowls and pour the hot stew over the top.
Serve with grilled sourdough bread and garnish with parsley.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    5
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Make the sauce: In a large pot over medium-low heat, combine the olive oil and garlic and cook until the garlic begins to sizzle very gently. Add the red pepper flakes and cook, stirring, until the garlic just begins to turn light golden in color, about 3 minutes. Add the Savory spice blend and continue to cook, stirring, for 1 minute more.',
    'Add the tomato paste and cook, stirring, until the paste has softened and blended with the oil and garlic mixture, about 3 minutes.',
    'Stir in the tomatoes and their juices and increase the heat to medium-high, bringing the to a gentle simmer. Lower the heat a bit if it’s bubbling and spitting too much. Remove the sauce from the heat.',
    'Using an immersion blender, blend the sauce until smooth. Tip: Drape a kitchen towel over the pot to act as a cover from sauce splatters. Or, transfer the sauce to a blender and puree, then return to the pot.',
    'Decrease the heat to medium-low and bring the sauce to a simmer.',
    'Make the meatballs: In a medium bowl, combine the bread cubes, cream, parmesan, onion, garlic, and pepper. Using a fork, mash into thick paste.',
    'In a large bowl, gently mix the ground pork with the salt and baking powder. Add the beef and gently stir to combine (you can also use your hands for this). Add the bread mixture, Savory spice blend, and a pinch more salt and pepper and mix until just incorporated. Rub a bit of olive oil on your hands and form the mixture into smooth, round meatballs the size of golf balls--you should have about 25 total..',
    'Once the meatballs are formed, gently lower each meatball into the pot of sauce. Bring to a low simmer, cover, and cook for 25-35 minutes, or until a meat thermometer inserted into a meatball reaches 165˚F (75˚C).',
    'While the meatballs are cooking, bring a large pot of salted water to a boil. Cook the spaghetti according to the package instructions. Reserve 1 cup (240 ml) of pasta cooking water, then drain.',
    'In a large bowl, toss the spaghetti with a few large spoonfuls of pasta sauce to coat, along with a few splashes of the reserved cooking water. Divide the pasta among bowls and spoon more sauce and meatballs over the pasta. Top each serving with freshly grated Parmesan and basil.',
    'Enjoy!',
    6
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Heat the oil in a large saucepan over a medium heat.',
    'Fry the garlic and ginger paste for a couple of minutes.',
    'Stir in the chili and onion and fry for about 5 minutes, until soft.',
    'Add the tomato, followed by the chili powder, turmeric, garam masala, salt, and pepper. Fry for another few minutes stirring continuously.',
    'Stir in the chicken and coriander and mix until evenly coated. Set the pan aside.',
    'In a smaller pan over medium heat, place on a paratha. Spoon on some of the chicken mix and place another paratha on top.',
    'Carefully seal the sides with your fingers, being careful not to touch the pan.',
    'Cook for a few minutes on each side until crisp and golden brown.',
    'Slice the parathas in half and serve with chutneys, raitas, or any other dips of your choice.',
    'Enjoy!',
    '',
    7
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Make the pumpkin pudding: Place the pumpkin in a medium bowl, cover the bowl with plastic wrap, and microwave for 5 minutes, until the pumpkin starts to soften. Let cool.',
    'In a microwave-proof ramekin, combine the water and gelatin and mix well. Set aside. Microwave the gelatin mixture for 10 seconds, then mix well.',
    'Combine the pumpkin, milk, heavy cream, maple syrup, and gelatin mixture in a blender. Blend until smooth.',
    'Place a medium bowl into a large bowl filled with ice. Strain the pumpkin mixture through a sieve into the medium bowl. Whisk until the mixture begins to thicken.',
    'Transfer the mixture to bundt pan and chill in the refrigerator for 2 hours.',
    'Make the chocolate ganache: Heat the heavy cream in a small saucepan until just boiling.',
    'Transfer to a medium bowl with the chocolate and mix until well combined and smooth.',
    'Invert the pudding onto a serving dish.',
    'Pour the chocolate ganache in the center hole until it overflows over the pudding cake and dust the cake with cocoa powder.',
    'Enjoy!',
    '',
    8
);

INSERT INTO steps (step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, recipe_id)
VALUES (
    'Pour coffee into ice molds and freeze.',
    'Pour sweetened cream into ice molds and freeze.',
    'Whip the remaining sweetened cream and set aside.',
    'Take 4 cubes of frozen coffee and place in a blender, add 1.5 oz whiskey and blend until foamy.',
    'Add 2 cubes of frozen sweetened cream and 1 tablespoon of chocolate, blend.',
    'Top with whip cream and drizzle with more chocolate.',
    'Enjoy!',
    '',
    '',
    '',
    '',
    9
);



INSERT INTO recipes (
    name,
    tag, 
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'After School Stuffed Cucumbers',
    'fish',
    '{
        "tuna:1 can", 
        "mayonnaise:1 tablespoon", 
        "mustard:1 tablespoon", 
        "salt:to taste", 
        "pepper:to taste",
        "cucumber:1",
        "cherry tomatoes:2"
    }',
    2,
    25,
    'snacks',
    'american',
    '{
        "Calories:152", 
        "Fat:9",
        "Carbs:1",
        "Fiber:0",
        "Sugar:0",
        "Protein:15"
     }',
     '{"https://powerhungry.com/wp-content/uploads/2018/12/sesame-sriracha-stuffed-cucumber-cups-7.png"}',
     'https://www.youtube.com/watch?v=Ct5eWqYPlxE',
     1
);
    




INSERT INTO recipes (
    name,
    tag,  
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Avocado Lime Salmon',
    'fish',
    '{
        "skinless salmon:170 g", 
        "clove garlic, minced:1", 
        "olive oil:to taste", 
        "salt:to taste", 
        "pepper:to taste",
        "paprika:0.5 teaspoon"
    }',
    1,
    20,
    'dinner',
    'american',
    '{
        "Calories:611", 
        "Fat:49",
        "Carbs:5",
        "Fiber:1",
        "Sugar:1",
        "Protein:34"
     }',
     '{"https://www.closetcooking.com/wp-content/uploads/2015/04/ChipotleLimeSalmonwithAvocadoSalsa8004286.jpg"}',
     'https://www.youtube.com/watch?v=y89swSBrBj8',
     2
);


INSERT INTO recipes (
    name,
    tag,  
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'One-Pan Honey Garlic Salmon & Asparagus',
    'fish',
    '{
        "asparagus trimmed:170 g", 
        "clove garlic, minced:7", 
        "olive oil:3 tablespoons", 
        "salt:to taste", 
        "pepper:to taste",
        "honey:4 teaspoon",
        "salmon:4 fillets"
    }',
    4,
    27,
    'lunch',
    'american',
    '{
        "Calories:196", 
        "Fat:12",
        "Carbs:11",
        "Fiber:1",
        "Sugar:8",
        "Protein:10"
     }',
     '{"https://img.buzzfeed.com/thumbnailer-prod-us-east-1/866baaa671874497bd0443dce083da78/BFV30877_WeekdayMealPrepFor4FB1080x1080.jpg"}',
     'https://www.youtube.com/watch?v=w3yBEaCyxE8',
     1
);



INSERT INTO recipes (
    name,
    tag,  
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Tuna Linguine With Tomatoes, Olives & Capers',
    'fish',
    '{
        "tuna:1 can (140 g)", 
        "clove garlic, thinly sliced:2", 
        "olive oil:2 tablespoons", 
        "salt:to taste", 
        "linguine:225 g",
        "caper:1 tablespoon",
        "dried oeregano:2 teaspoons",
        "tomato paste:2 tablespoons",
        "red chilli flakes:0.5 teaspoon",
        "diced tomato:14 (395 g)"
    }',
    4,
    22,
    'dinner',
    'italian',
    '{
        "Calories:378", 
        "Fat:11",
        "Carbs:52",
        "Fiber:4",
        "Sugar:6",
        "Protein:17"
     }',
     '{"https://www.closetcooking.com/wp-content/uploads/2010/12/TunaandCaperTomatoPasta500.jpg"}',
     'https://www.youtube.com/watch?v=Pyf9ZmjTndo',
     1
);



INSERT INTO recipes (
    name, 
    tag,
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Cioppino',
    'fish',
    '{
        "unsalted butter, divided:4 tablespoons", 
        "extra virgin olive oil:1 cup (240 mL)", 
        "large carrots, peeled, trimmed, and minced:2", 
        "leek, white part only, trimmed, cleaned, and minced:1", 
        "large yellow onion, minced:1", 
        "red bell pepper, cored, seeded, and minced:1", 
        "small fennel bulb, trimmed, and minced:1", 
        "green bell pepper, cored, seeded, and minced:1", 
        "celeries, minced:2", 
        "cloves garlic, finely chopped:4", 
        "cloves garlic, crushed:3", 
        "salt:to taste", 
        "freshly cracked pepper:to taste", 
        "tomato paste:170 g", 
        "dried basil:1 tablespoon", 
        "dried oregano:1 tablespoon", 
        "dried thyme:1 tablespoon", 
        "dried cayenne:1 tablespoon", 
        "dry white wine divided:2 cups (480 mL)", 
        "crushed italian tomato:2 cans (425 g)",
        "bay leaves:3",
        "sea scallop:225 g",
        "shrimp peeled and deveined:225 g",
        "squid sliced:225 g",
        "halibut fillet, cut into large pieces:225 g",
        "manila clam, scrubbed:225 g",
        "mussel, scrubbed:225 g",
        "sourdough bread, grilled:to taste",
        "bunch fresh parsley, chopped, for garnish:0.5"
    }',
    6,
    44,
    'dinner',
    'italian',
    '{
        "Calories:813", 
        "Fat:52",
        "Carbs:37",
        "Fiber:4",
        "Sugar:7",
        "Protein:44"
     }',
     '{"https://food.fnr.sndimg.com/content/dam/images/food/fullset/2009/3/16/1/EI0709_32499_s4x3.jpg.rend.hgtvcom.826.620.suffix/1382543843419.jpeg"}',
     'https://www.youtube.com/results?search_query=Cioppino',
     1
);



INSERT INTO recipes (
    name, 
    tag,
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Savoury Spaghetti With Meatballs',
    'beef',
    '{
        "olive oil:2 tablespoons", 
        "cloves, garlic:5", 
        "red pepper flakes:0.5 teaspoon", 
        "McCormick® Savory Spice Blend:1 tablespoon", 
        "Tomato paste:3 tablespoons", 
        "Canned whole peeled tomato:1500 g", 
        "kosher salt:to taste"
    }',
    8,
    50,
    'dinner',
    'italian',
    '{
        "Calories:691", 
        "Fat:36",
        "Carbs:52",
        "Fiber:5",
        "Sugar:8",
        "Protein:41"
     }',
     '{"https://www.onceuponachef.com/images/2019/09/Easy-Spaghetti-and-Meatball-Recipe-760x1057.jpg"}',
     'https://www.youtube.com/watch?v=ItURXZjQ5kg',
     2
);



INSERT INTO recipes (
    name, 
    tag,
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Chili Chicken-stuffed Parathas',
    'chicken',
    '{
        "olive oil:1 tablespoon", 
        "garlic ginger paste:1 tablespoon", 
        "red chilli, diced:1", 
        "onion, diced:1", 
        "tomato, chopped:1", 
        "chilli powder:1 teaspoon", 
        "tumeric:1 teaspoon", 
        "garam masala:1 tablespoons", 
        "salt:1 teaspoon", 
        "pepper:1 teaspoon", 
        "chicken, cooked and shredded:3.75 cups (400 g)", 
        "bunch fresh coriander, small bunch, chopped:1", 
        "parathas, defrosted:10"

    }',
    5,
    25,
    'lunch',
    'indian',
    '{
        "Calories:343", 
        "Fat:8",
        "Carbs:30",
        "Fiber:1",
        "Sugar:0",
        "Protein:35"
     }',
     '{"https://i.pinimg.com/236x/49/ee/b8/49eeb8a7fad779d71cd43b59d1f9baf6.jpg"}',
     'https://www.youtube.com/watch?v=ecq85gG-vWo',
     2
);


INSERT INTO recipes (
    name, 
    tag,
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Frozen Irish Coffee',
    'beverage',
    '{
        "strong black coffee, cooled:2 cups (470 g)", 
        "sweetened cream:1.5 cups (355 mL)", 
        "irish whiskey:90 mL", 
        "chocolate bar, melted: 1"
    }',
    1,
    20,
    'beverages',
    'japanese',
    '{
        "Calories:789", 
        "Fat:66",
        "Carbs:33",
        "Fiber:1",
        "Sugar:30",
        "Protein:7"
     }',
     '{"https://img.buzzfeed.com/buzzfeed-static/static/2017-03/16/17/asset/buzzfeed-prod-fastlane-01/sub-buzz-24374-1489699600-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto"}',
     'https://www.youtube.com/watch?v=Y5rx-pwa5ZM',
     2
);


INSERT INTO recipes (
    name, 
    tag,
    ingredient_list,
    servings,
    difficulty, 
    meal_type, 
    cuisine, 
    nutrition_info, 
    image_url_list, 
    video_url_list, 
    user_id_created)
VALUES (
    'Giant Pumpkin Fondue Pudding',
    'dessert',
    '{
        "pumpkin, peeled and chopped:400 g",
        "gelatin:5 teaspoons (15 g)",
        "water:3 teaspoons",
        "milk:3 cups (400 mL)",
        "heavy cream:0.75 cups (200 mL)",
        "maple syrup:0.5 cup cups (100 g)"
    }',
    4,
    40,
    'snacks',
    'japanese',
    '{
        "Calories:324", 
        "Fat:27",
        "Carbs:24",
        "Fiber:0",
        "Sugar:22",
        "Protein:5"
     }',
     '{"https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/baked-pumpkin-fondue.jpg?itok=3txi1KfQ",
     "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/baked-pumpkin-fondue.jpg?itok=3txi1KfQ"}',
     'https://www.youtube.com/watch?v=C6VIexjKlkQ',
     2
);
