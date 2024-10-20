delete from Pantry_Inventory;
delete from Instructions ; 
delete from Meal_Ingredients;
delete from Meals;
delete from User_Dietary_Preferences;
delete from Users_Health_Goals;
delete from Shopping_List_Ingredients;
delete from  Shopping_List;
delete from Users; 
delete from Ingredients;

------CREATE TABLE COMMANDS --------------------------------------------------

CREATE TABLE "Users" (
"user_id" INTEGER(10),
"name" TEXT, 
"age" INTEGER(10), "
gender" char(1), "phone_number" VARCHAR(15), 
"address" TEXT, 
"country" VARCHAR(50),
 "zipcode" VARCHAR(10), "activity_levels" VARCHAR(50), PRIMARY KEY("user_id") )


CREATE TABLE
"User_Dietry_Preferences"
(
"user_dietry_preference_id" INTEGER(10),
"fk_user_id" INTEGER(10),
"diet_name" VARCHAR(50), PRIMARY KEY("user_dietry_preference_id"), 
FOREIGN KEY("fk_user_id") REFERENCES "Users"("user_id") )
 
 CREATE TABLE
"Users_Health_Goals" (
"user_health_goals_id" INTEGER(10), 
"fk_user_id" INTEGER(10), 
"goal_name" varchar(50), PRIMARY KEY("user_health_goals_id"),
 FOREIGN KEY("fk_user_id") REFERENCES "Users"("user_id") )

CREATE TABLE "Ingredients"
( "Ingredient_id"
INTEGER(10), "name"TEXT(500), "category" varchar(50), PRIMARY KEY("Ingredient_id") )

CREATE TABLE "Meals" (
"meal_id" INTEGER(10),
"meal_name" varchar(100),
"category" varchar(50),
"prep_time" INTEGER(20),
"nutritional_info"
TEXT(500), "ingredients"
TEXT(500), PRIMARY KEY("meal_id") )

CREATE TABLE
"Instructions" (
"Instruction_id" INTEGER(10), "fk_meal_id" INTEGER(10), "step_number" INTEGER(10), "description"
TEXT(500), PRIMARY KEY("Instruction_id"), FOREIGN KEY("fk_meal_id") REFERENCES "Meals"("meal_id") )



CREATE TABLE
"Meal_Ingredients" (
"meal_ingredient_id" INTEGER(10), "fk_ingredient_id" INTEGER(10), "fk_meal_id" INTEGER(10),
"ingredient_quantity" INTEGER(10), PRIMARY KEY("meal_ingredient_id"),
FOREIGN KEY("fk_meal_id") REFERENCES "Meals"("meal_id"),
FOREIGN KEY("fk_ingredient_id") REFERENCES "Ingredients"("Ingredient_id") )


CREATE TABLE
"Pantry_Inventory" (
"pantry_id" INTEGER(10),
"fk_user_id" INTEGER(10),
"fk_ingredient_id" INTEGER(10),
"pantry_quantity" INTEGER(10),
"expiration_date" DATE,
"last_updated" DATE,
PRIMARY KEY("pantry_id"),
FOREIGN KEY("fk_user_id") REFERENCES "Users"("user_id"), 
FOREIGN KEY("fk_ingredient_id")REFERENCES"Ingredients"("Ingredient_id") )


CREATE TABLE
"Shopping_List" (
"list_id" INTEGER(10),
"fk_user_id" INTEGER(10),
PRIMARY KEY("list_id"),
FOREIGN KEY("fk_user_id") REFERENCES "Users"("user_id") )


CREATE TABLE "Shopping_List_Ingredients "( "shopping_ingredients_id" INTEGER(10), "fk_list_id" INTEGER(10), "fk_ingredient_id" INTEGER(10), "quantity_needed" INTEGER(10), 
"status" INTEGER(10), PRIMARY KEY("shopping_ingredients_ id"), FOREIGN KEY("fk_ingredient_id") REFERENCES,"Ingredients"("Ingredient_id"), FOREIGN KEY("fk_list_id") REFERENCES "Shopping_List"("list_id"))


 ---- ALTER commands 
 
 ALTER TABLE Meals ADD COLUMN dietary_preferences TEXT;
ALTER TABLE Meals ADD COLUMN suitable_activity_levels TEXT;
ALTER TABLE Meals ADD COLUMN health_goals TEXT;

 
 
----- INSERT COMMANDS ------------------------------------------------------------------

ALTER TABLE Meals ADD COLUMN dietary_preferences TEXT;
ALTER TABLE Meals ADD COLUMN suitable_activity_levels TEXT;
ALTER TABLE Meals ADD COLUMN health_goals TEXT;



--Users Table
INSERT INTO Users (user_id, name, age, gender, phone_number, address, country, zipcode, activity_levels)
VALUES
(1, 'Alice Johnson', 28, 'F', '123-456-7890', '123 Maple St', 'USA', '02101', 'Active'),
(2, 'Bob Smith', 35, 'M', '234-567-8901', '456 Oak St', 'USA', '02102', 'Moderate'),
(3, 'Charlie Davis', 22, 'M', '345-678-9012', '789 Pine St', 'USA', '02103', 'Sedentary'),
(4, 'Diana Evans', 31, 'F', '456-789-0123', '101 Birch St', 'USA', '02104', 'Active'),
(5, 'Evan Harris', 29, 'M', '567-890-1234', '202 Cedar St', 'USA', '02105', 'Moderate'),
(6, 'Fiona Green', 27, 'F', '678-901-2345', '303 Spruce St', 'USA', '02106', 'Sedentary'),
(7, 'George Brown', 34, 'M', '789-012-3456', '404 Elm St', 'USA', '02107', 'Active'),
(8, 'Hannah Wilson', 23, 'F', '890-123-4567', '505 Ash St', 'USA', '02108', 'Moderate'),
(9, 'Ian Thomas', 26, 'M', '901-234-5678', '606 Willow St', 'USA', '02109', 'Sedentary'),
(10, 'Julia White', 32, 'F', '012-345-6789', '707 Poplar St', 'USA', '02110', 'Active');

--Users_Health_Goals Table
INSERT INTO Users_Health_Goals (user_health_goals_id, fk_user_id, goal_name)
VALUES
(1, 1, 'Lose Weight'),
(2, 2, 'Build Muscle'),
(3, 3, 'Maintain Weight'),
(4, 4, 'Improve Endurance'),
(5, 5, 'Increase Flexibility'),
(6, 6, 'Gain Weight'),
(7, 7, 'Reduce Stress'),
(8, 8, 'Increase Energy'),
(9, 9, 'Improve Sleep'),
(10, 10, 'Boost Immunity'),
(11, 1, 'Build Muscle'); -- Additional health goal for user 1

--User_Dietary_Preferences Table
INSERT INTO User_Dietary_Preferences (user_dietary_preference_id, fk_user_id, diet_name)
VALUES
(1, 1, 'Vegetarian'),
(2, 2, 'Vegan'),
(3, 3, 'Keto'),
(4, 4, 'Paleo'),
(5, 5, 'Mediterranean'),
(6, 6, 'Low Carb'),
(7, 7, 'Gluten Free'),
(8, 8, 'Dairy Free'),
(9, 9, 'Pescatarian'),
(10, 10, 'Balanced'),
(11, 1, 'Gluten Free'); -- Additional dietary preference for user 1

--Ingredients Table
INSERT INTO Ingredients (ingredient_id, name, category)
VALUES
(1, 'Tomato', 'Vegetable'),
(2, 'Lettuce', 'Vegetable'),
(3, 'Chicken', 'Protein'),
(4, 'Beef', 'Protein'),
(5, 'Apple', 'Fruit'),
(6, 'Banana', 'Fruit'),
(7, 'Milk', 'Dairy'),
(8, 'Cheese', 'Dairy'),
(9, 'Bread', 'Grain'),
(10, 'Rice', 'Grain');

--Pantry_Inventory Table
INSERT INTO Pantry_Inventory (pantry_id, fk_user_id, fk_ingredient_id, pantry_quantity, expiration_date, last_updated)
VALUES
(1, 1, 1, 1, '2024-07-01', '2024-06-25'),
(2, 2, 2, 3, '2024-07-02', '2024-06-25'),
(3, 3, 3, 1, '2024-07-03', '2024-06-25'),
(4, 4, 4, 2, '2024-07-04', '2024-06-25'),
(5, 5, 5, 7, '2024-07-05', '2024-06-25'),
(6, 6, 6, 1, '2024-07-06', '2024-06-25'),
(7, 7, 7, 2, '2024-07-07', '2024-06-25'),
(8, 8, 8, 4, '2024-07-08', '2024-06-25'),
(9, 9, 9, 1, '2024-07-09', '2024-06-25'),
(10, 10, 10, 3, '2024-07-10', '2024-06-25');

--Meals Table
INSERT INTO Meals (meal_id, meal_name, category, prep_time, nutritional_info, dietary_preferences, suitable_activity_levels, health_goals)
VALUES
(1, 'Grilled Chicken Salad', 'Lunch', 20, 'High Protein', 'High Protein', 'Active, Moderate', 'Build Muscle, Maintain Weight'),
(2, 'Beef Stir Fry', 'Dinner', 30, 'High Protein', 'High Protein', 'Active', 'Build Muscle'),
(3, 'Tomato Soup', 'Appetizer', 15, 'Low Calorie', 'Vegetarian, Vegan', 'Sedentary, Moderate, Active', 'Lose Weight, Maintain Weight'),
(4, 'Fruit Smoothie', 'Breakfast', 10, 'High Fiber', 'Vegan', 'Active, Moderate', 'Increase Energy, Improve Digestion'),
(5, 'Cheese Omelette', 'Breakfast', 10, 'High Protein', 'Vegetarian', 'Active, Moderate', 'Build Muscle, Maintain Weight'),
(6, 'Vegetable Stir Fry', 'Dinner', 25, 'Low Calorie', 'Vegan, Vegetarian', 'Active, Moderate', 'Lose Weight, Maintain Weight'),
(7, 'Apple Pie', 'Dessert', 45, 'High Sugar', 'Vegetarian', 'Sedentary, Moderate', 'Maintain Weight'),
(8, 'Banana Pancakes', 'Breakfast', 20, 'Moderate Sugar', 'Vegetarian', 'Moderate, Active', 'Maintain Weight'),
(9, 'Chicken Sandwich', 'Lunch', 15, 'High Protein', 'High Protein', 'Active, Moderate', 'Build Muscle'),
(10, 'Rice Pudding', 'Dessert', 30, 'High Sugar', 'Vegetarian', 'Sedentary, Moderate', 'Maintain Weight');


--Meal_Ingredients Table
INSERT INTO Meal_Ingredients (meal_ingredient_id, fk_ingredient_id, fk_meal_id, ingredient_quantity)
VALUES
(1, 1, 1, 2), -- Grilled Chicken Salad: Tomato
(2, 2, 1, 6), -- Grilled Chicken Salad: Lettuce
(3, 3, 1, 5), -- Grilled Chicken Salad: Chicken
(4, 4, 2, 3), -- Beef Stir Fry: Beef
(5, 1, 3, 4), -- Tomato Soup: Tomato
(6, 5, 3, 1), -- Tomato Soup: Apple
(7, 6, 4, 4), -- Fruit Smoothie: Banana
(8, 7, 4, 2), -- Fruit Smoothie: Milk
(9, 7, 5, 2), -- Cheese Omelette: Milk
(10, 8, 5, 1), -- Cheese Omelette: Cheese
(11, 6, 8, 4), -- Banana Pancakes: Banana
(12, 7, 8, 2), -- Banana Pancakes: Milk
(13, 9, 8, 1), -- Banana Pancakes: Bread
(14, 3, 9, 5), -- Chicken Sandwich: Chicken
(15, 9, 9, 4), -- Chicken Sandwich: Bread
(16, 2, 9, 2), -- Chicken Sandwich: Lettuce
(17, 1, 6, 2), -- Vegetable Stir Fry: Tomato
(18, 2, 6, 3), -- Vegetable Stir Fry: Lettuce
(19, 10, 10, 2); -- Rice Pudding: Rice

--Instructions Table
INSERT INTO Instructions (instruction_id, fk_meal_id, step_number, description)
VALUES
(1, 1, 1, 'Chop the vegetables: Tomato and Lettuce'), -- Grilled Chicken Salad
(2, 1, 2, 'Grill the chicken'), -- Grilled Chicken Salad
(3, 1, 3, 'Mix all ingredients together: Tomato, Lettuce, and Chicken'), -- Grilled Chicken Salad
(4, 2, 1, 'Slice the beef'), -- Beef Stir Fry
(5, 2, 2, 'Stir fry the beef with vegetables'), -- Beef Stir Fry
(6, 3, 1, 'Boil the tomatoes and apple'), -- Tomato Soup
(7, 3, 2, 'Blend the tomatoes and apple'), -- Tomato Soup
(8, 4, 1, 'Slice the banana'), -- Fruit Smoothie
(9, 4, 2, 'Blend the banana with milk'), -- Fruit Smoothie
(10, 5, 1, 'Beat the eggs with milk'), -- Cheese Omelette
(11, 5, 2, 'Cook the eggs with cheese'), -- Cheese Omelette
(12, 6, 1, 'Chop the vegetables: Tomato and Lettuce'), -- Vegetable Stir Fry
(13, 6, 2, 'Stir fry the vegetables'), -- Vegetable Stir Fry
(14, 7, 1, 'Prepare the pie crust'), -- Apple Pie
(15, 7, 2, 'Bake the pie with apple filling'), -- Apple Pie
(16, 8, 1, 'Mash the bananas and mix with bread and milk'), -- Banana Pancakes
(17, 8, 2, 'Cook the pancakes with banana mix'), -- Banana Pancakes
(18, 9, 1, 'Grill the chicken'), -- Chicken Sandwich
(19, 9, 2, 'Assemble the sandwich with bread, chicken, and lettuce'), -- Chicken Sandwich
(20, 10, 1, 'Cook the rice'), -- Rice Pudding
(21, 10, 2, 'Mix the rice with milk and sugar'); -- Rice Pudding

--Shopping_List Table
-- Shopping_List Table
INSERT INTO Shopping_List (list_id, fk_user_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 3); -- Additional shopping list for user 3

-- Shopping_List_Ingredients Table
INSERT INTO Shopping_List_Ingredients (shopping_ingredients_id, fk_list_id, fk_ingredient_id, status)
VALUES
(1, 1, 1, 0),
(2, 2, 2, 0),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 0),
(6, 6, 6, 0),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 0),
(10, 10, 10, 0),
(11, 11, 1, 1); -- Ingredient for additional shopping list of user 3

----- SELECT STATEMENTS ------------------------------------------------------------------------------

-- Retrieve the dietary preferences of each user.

SELECT u.name, udp.diet_name
FROM Users u
JOIN User_Dietary_Preferences udp ON u.user_id = udp.fk_user_id;

--  Calculate and retrieve the quantity of ingredients needed for shopping, considering pantry inventory.
SELECT 
    u.name, 
    sl.list_id AS fk_list_id, 
	m.meal_name,
    mi.ingredient_quantity - COALESCE(pi.pantry_quantity, 0) AS quantity_needed, 
    i.name AS ingredient_name
FROM 
    Users u
JOIN 
    Shopping_List sl ON u.user_id = sl.fk_user_id
JOIN 
    Shopping_List_Ingredients sli ON sl.list_id = sli.fk_list_id
JOIN 
    Ingredients i ON sli.fk_ingredient_id = i.ingredient_id
JOIN 
    Meal_Ingredients mi ON mi.fk_ingredient_id = i.ingredient_id
JOIN
	Meals m on m.meal_id = mi.fk_meal_id
LEFT JOIN 
    Pantry_Inventory pi ON u.user_id = pi.fk_user_id AND i.ingredient_id = pi.fk_ingredient_id
WHERE 
    (mi.ingredient_quantity - COALESCE(pi.pantry_quantity, 0)) > 0
and ;


--Retrieve the health goals of each user.
SELECT u.name, uhg.goal_name
FROM Users u
JOIN Users_Health_Goals uhg ON u.user_id = uhg.fk_user_id;

--Retrieve the pantry inventory details for each user, including ingredient quantities and expiration dates.
SELECT u.name, i.name AS ingredient_name, pi.pantry_quantity, pi.expiration_date
FROM Users u
JOIN Pantry_Inventory pi ON u.user_id = pi.fk_user_id
JOIN Ingredients i ON pi.fk_ingredient_id = i.ingredient_id;



--Retrieve the ingredients and preparation instructions for each meal, ordered by meal name and step number.
SELECT 
    m.meal_name, 
    GROUP_CONCAT(i.name) AS ingredients, 
    GROUP_CONCAT(mi.ingredient_quantity) AS quantities,
    ins.step_number, 
    ins.description
FROM Meals m
JOIN Meal_Ingredients mi ON m.meal_id = mi.fk_meal_id
JOIN Ingredients i ON mi.fk_ingredient_id = i.ingredient_id
JOIN Instructions ins ON m.meal_id = ins.fk_meal_id
GROUP BY m.meal_id, ins.step_number, ins.description
ORDER BY m.meal_name, ins.step_number;


---- Meal suggestions

CREATE VIEW UserPreferences AS
SELECT 
    u.user_id,
    u.name,
    u.activity_levels,
    GROUP_CONCAT(DISTINCT d.diet_name) AS dietary_preferences,
    GROUP_CONCAT(DISTINCT h.goal_name) AS health_goals
FROM 
    Users u
JOIN 
    User_Dietary_Preferences d ON u.user_id = d.fk_user_id
JOIN 
    Users_Health_Goals h ON u.user_id = h.fk_user_id
GROUP BY 
    u.user_id;
	
	
-- Assume user_id = 1 for this example based on dietary_preferences 
SELECT 
    u.user_id,
    u.name AS user_name,
    u.activity_levels,
    u.dietary_preferences,
    u.health_goals,
    m.meal_id,
    m.meal_name,
    m.category,
    m.prep_time,
    m.nutritional_info
FROM 
    UserPreferences u
JOIN 
    Meals m ON (
        u.dietary_preferences LIKE '%' || m.dietary_preferences || '%'  --AND
    )
WHERE u.user_id =1
ORDER BY 
    m.meal_name;


	-- Assume user_id = 1 for this example based on health_goals 
SELECT 
    u.user_id,
    u.name AS user_name,
    u.activity_levels,
    --u.dietary_preferences,
    u.health_goals,
    m.meal_id,
    m.meal_name,
    m.category,
    m.prep_time,
    m.nutritional_info
FROM 
    UserPreferences u
JOIN 
    Meals m ON (
		u.health_goals LIKE '%' || m.health_goals || '%'
    )
WHERE u.user_id =1
ORDER BY 
    m.meal_name;
	
	





