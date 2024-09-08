use node44

use node44

CREATE TABLE videos(
video_id int PRIMARY KEY auto_increment,
video_name VARCHAR(50),
dectiptions VARCHAR(250)
)

-- Insert 20 sample rows into the table
INSERT INTO videos (video_name, dectiptions) VALUES
('Introduction to C#', 'A beginner-level introduction to C# programming'),
('What is the params keyword?', 'Explanation and use cases of the params keyword in C#'),
('Understanding Arrays in C#', 'An in-depth look at arrays and how to use them in C#'),
('Classes and Objects', 'Exploring object-oriented programming in C# with practical examples'),
('Methods in C#', 'Introduction to methods, parameters, and return types in C#'),
('Inheritance in C#', 'Understanding inheritance and its use in OOP in C#'),
('Polymorphism in C#', 'Learn how polymorphism works in C# with practical examples'),
('Exception Handling in C#', 'How to handle errors using try, catch, and finally blocks'),
('File Handling in C#', 'Working with files in C# for reading and writing data'),
('Asynchronous Programming in C#', 'An introduction to async and await for asynchronous code'),
('Introduction to LINQ', 'Exploring LINQ and its powerful features for querying collections'),
('Delegates and Events', 'Understanding how to work with delegates and events in C#'),
('Lambda Expressions', 'Introduction to lambda expressions and their usage in C#'),
('What if: Variables Change Types?', 'A fun exploration of dynamic variables and type changes in C#'),
('Switch Case Feature in C#', 'Understanding the switch statement in C# and its practical uses'),
('Working with Databases in C#', 'How to connect and interact with databases using C#'),
('Entity Framework Basics', 'Learn how to use Entity Framework for database management in C#'),
('Debugging C# Code', 'Tips and techniques for debugging your C# code effectively'),
('Creating a Simple Web API', 'How to build a simple Web API using C# and ASP.NET Core'),
('Game Development in C#', 'Introduction to basic game development concepts in C#')
;

SELECT * FROM videos
SELECT * FROM users

CREATE TABLE user_like(
id int PRIMARY KEY auto_increment,
user_id INT,
FOREIGN KEY(user_id) REFERENCES users(user_id),
video_id INT,
FOREIGN KEY(video_id) REFERENCES videos(video_id)
)

INSERT INTO user_like (user_id, video_id) VALUES
(1, 1),
(3, 3),
(1, 4),
(3, 6),
(1, 7),
(3, 9),
(1, 10),
(3, 12),
(1, 13),
(3, 15),
(1, 16),
(3, 18),
(1, 19)

SELECT * FROM user_like

-- inner join
SELECT u.full_name, v.video_name FROM users as u
INNER JOIN user_like as ul on u.user_id = ul.user_id
INNER JOIN videos as v on v.video_id = ul.video_id

--left join : tất cả các record của table bên trái và phần giao nhau
SELECT u.full_name,u.user_id,ul.user_id FROM users as u
LEFT JOIN user_like as ul on u.user_id = ul.user_id
--right join : tất cả các record của table bên phải và phần giao nhau
SELECT u.full_name,u.user_id,ul.user_id FROM users as u
RIGHT JOIN user_like as ul on u.user_id = ul.user_id

# self join

CREATE TABLE employees(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50),
	line_manager_id INT
)

-- self join

CREATE TABLE employees(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50),
	line_manager_id INT
)

INSERT INTO employees (user_name, line_manager_id) VALUES
('John Doe', NULL),    
('Jane Smith', 1),
('Mike Johnson', 1),
('Emily Davis', 1),
('Chris Brown', 2),
('Anna Wilson', 2),
('James Clark', 3),
('Laura Miller', 3),
('Robert Lewis', 4),
('Jennifer Lee', 4),
('David Walker', 5),
('Emma Hall', 5),
('Daniel Young', 6),
('Sophia Harris', 6),
('Matthew King', 7),
('Olivia Wright', 7),
('Joseph Allen', 8), 
('Mia Scott', 8),     
('William Green', 9),
('Ava Adams', 9);

-- self join
select e1.user_name, e2.user_name as line_manager_name from employees e1
left join employees e2 ON e1.line_manager_id=e2.user_id






-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- tạo database app food
--tạo table users
CREATE TABLE users (
user_id INT PRIMARY key auto_increment,
full_name VARCHAR(50)  not NULL,
email VARCHAR(255)  not NULL,
pass_word VARCHAR(255)  not NULL
) 
-- insert data user
INSERT INTO users (full_name, email, pass_word) VALUES
('John Doe', 'johndoe@example.com', 'password123'),
('Jane Smith', 'janesmith@example.com', 'securepass'),
('Mike Johnson', 'mikejohnson@example.com', 'mypassword'),
('Emily Davis', 'emilydavis@example.com', 'emily123'),
('Chris Brown', 'chrisbrown@example.com', 'brownsecure'),
('Anna Wilson', 'annawilson@example.com', 'annapass'),
('James Clark', 'jamesclark@example.com', 'james1234'),
('Laura Miller', 'lauramiller@example.com', 'laura789'),
('Robert Lewis', 'robertlewis@example.com', 'robertpass'),
('Jennifer Lee', 'jenniferlee@example.com', 'jenpass456'),
('David Walker', 'davidwalker@example.com', 'davidpass'),
('Emma Hall', 'emmahall@example.com', 'emmahall789'),
('Daniel Young', 'danielyoung@example.com', 'daniel321'),
('Sophia Harris', 'sophiaharris@example.com', 'sophiah123'),
('Matthew King', 'matthewking@example.com', 'kingpass'),
('Olivia Wright', 'oliviawright@example.com', 'wrightsecure'),
('Joseph Allen', 'josephallen@example.com', 'allen789'),
('Mia Scott', 'miascott@example.com', 'miapassword'),
('William Green', 'williamgreen@example.com', 'willgreen'),
('Ava Adams', 'avaadams@example.com', 'adams789');
-- table restaurant
CREATE TABLE restaurants (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(100) NOT NULL,
    image TEXT,
    description TEXT
);

-- Insert 10 sample rows into the restaurants table
INSERT INTO restaurants (res_name, image, description) VALUES
('The Gourmet Kitchen', 'gourmet_kitchen.jpg', 'A high-end restaurant offering a variety of gourmet dishes.'),
('Sunny Side Café', 'sunny_side_cafe.jpg', 'A cozy café known for its delicious breakfast and brunch options.'),
('Ocean Breeze Seafood', 'ocean_breeze.jpg', 'Specializes in fresh seafood with a scenic ocean view.'),
('Bella Italia', 'bella_italia.jpg', 'Authentic Italian restaurant serving pasta, pizza, and other Italian delicacies.'),
('Spice Route', 'spice_route.jpg', 'A modern Indian restaurant with a blend of traditional and contemporary flavors.'),
('The Green Garden', 'green_garden.jpg', 'A vegetarian and vegan-friendly restaurant with a variety of organic options.'),
('Steakhouse Supreme', 'steakhouse_supreme.jpg', 'Famous for its prime steaks and exceptional grill experience.'),
('Sushi Zen', 'sushi_zen.jpg', 'Japanese restaurant offering fresh sushi, sashimi, and other traditional dishes.'),
('The Rustic Tavern', 'rustic_tavern.jpg', 'A pub-style eatery with a variety of beers and comfort food.'),
('Fusion Fiesta', 'fusion_fiesta.jpg', 'A vibrant restaurant offering a fusion of Asian, Latin, and Mediterranean cuisines.');

-- table food type 
-- Create the food_type table
CREATE TABLE food_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
);

-- Insert 20 sample rows into the food_type table
INSERT INTO food_type (type_name) VALUES
('Italian'),
('Chinese'),
('Mexican'),
('Indian'),
('Japanese'),
('Mediterranean'),
('Thai'),
('French'),
('Spanish'),
('American'),
('Vietnamese'),
('Korean'),
('Greek'),
('Turkish'),
('Lebanese'),
('Brazilian'),
('Caribbean'),
('German'),
('Russian'),
('Moroccan');

-- table food
-- Tạo bảng food
CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,  
    food_name VARCHAR(255),                  
    image VARCHAR(255),                    
    price FLOAT,                            
    description VARCHAR(255),                   
    type_id INT,                          
    FOREIGN KEY (type_id) REFERENCES food_type(type_id) on DELETE CASCADE
);

-- Insert 100 sample rows into the food table
INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Spaghetti Carbonara', 'carbonara.jpg', 12.99, 'Classic Italian pasta with creamy sauce and pancetta.', 1),
('Kung Pao Chicken', 'kung_pao.jpg', 10.50, 'Spicy Chinese stir-fry with chicken, peanuts, and vegetables.', 2),
('Tacos Al Pastor', 'tacos.jpg', 8.99, 'Mexican tacos with marinated pork and pineapple.', 3),
('Butter Chicken', 'butter_chicken.jpg', 13.50, 'Indian curry with tender chicken in a creamy tomato sauce.', 4),
('Sushi Platter', 'sushi_platter.jpg', 22.99, 'Assortment of fresh sushi rolls and sashimi.', 5),
('Greek Salad', 'greek_salad.jpg', 7.99, 'Mediterranean salad with feta cheese, olives, and vegetables.', 13),
('Pad Thai', 'pad_thai.jpg', 9.99, 'Traditional Thai stir-fried noodles with shrimp and peanuts.', 7),
('Beef Bourguignon', 'beef_bourguignon.jpg', 18.50, 'French beef stew braised in red wine and herbs.', 8),
('Paella', 'paella.jpg', 15.99, 'Spanish rice dish with seafood, chicken, and saffron.', 9),
('Cheeseburger', 'cheeseburger.jpg', 8.50, 'Classic American burger with cheese, lettuce, and tomato.', 10),
('Pho', 'pho.jpg', 8.99, 'Vietnamese noodle soup with beef and fresh herbs.', 11),
('Bibimbap', 'bibimbap.jpg', 12.50, 'Korean rice dish with vegetables, beef, and a fried egg.', 12),
('Moussaka', 'moussaka.jpg', 14.99, 'Greek casserole with layers of eggplant, meat, and béchamel.', 13),
('Shish Kebab', 'shish_kebab.jpg', 11.99, 'Turkish skewers with grilled meat and vegetables.', 14),
('Falafel Wrap', 'falafel_wrap.jpg', 7.50, 'Lebanese wrap with crispy falafel and fresh veggies.', 15),
('Feijoada', 'feijoada.jpg', 13.99, 'Brazilian stew of beans with beef and pork.', 16),
('Jerk Chicken', 'jerk_chicken.jpg', 10.99, 'Caribbean grilled chicken marinated with spices.', 17),
('Bratwurst', 'bratwurst.jpg', 6.99, 'German sausage served with mustard and sauerkraut.', 18),
('Borscht', 'borscht.jpg', 8.50, 'Russian beet soup served with sour cream.', 19),
('Couscous', 'couscous.jpg', 9.99, 'Moroccan steamed semolina served with vegetables.', 20),
('Margherita Pizza', 'margherita_pizza.jpg', 10.50, 'Classic Italian pizza with tomatoes, mozzarella, and basil.', 1),
('Spring Rolls', 'spring_rolls.jpg', 5.99, 'Chinese crispy rolls filled with vegetables and meat.', 2),
('Quesadilla', 'quesadilla.jpg', 7.99, 'Mexican grilled tortilla with cheese and chicken.', 3),
('Chicken Tikka Masala', 'tikka_masala.jpg', 12.99, 'Indian curry with marinated chicken in a spiced tomato sauce.', 4),
('Ramen', 'ramen.jpg', 11.50, 'Japanese noodle soup with pork, egg, and green onions.', 5),
('Hummus', 'hummus.jpg', 4.99, 'Mediterranean dip made from chickpeas, tahini, and olive oil.', 13),
('Green Curry', 'green_curry.jpg', 9.99, 'Spicy Thai curry with green chili, chicken, and coconut milk.', 7),
('Coq au Vin', 'coq_au_vin.jpg', 17.50, 'French braised chicken cooked in red wine.', 8),
('Tapas Plate', 'tapas_plate.jpg', 14.99, 'Spanish small bites with a variety of flavors.', 9),
('BBQ Ribs', 'bbq_ribs.jpg', 13.50, 'American-style slow-cooked ribs with barbecue sauce.', 10),
('Banh Mi', 'banh_mi.jpg', 6.99, 'Vietnamese sandwich with pork, pickled vegetables, and herbs.', 11),
('Kimchi Fried Rice', 'kimchi_fried_rice.jpg', 9.50, 'Korean stir-fried rice with kimchi and vegetables.', 12),
('Souvlaki', 'souvlaki.jpg', 10.99, 'Greek grilled meat skewers served with pita bread.', 13),
('Baklava', 'baklava.jpg', 5.50, 'Turkish dessert made with layers of phyllo dough and honey.', 14),
('Shawarma', 'shawarma.jpg', 7.99, 'Lebanese wrap with spiced meat and tahini sauce.', 15),
('Moqueca', 'moqueca.jpg', 14.50, 'Brazilian seafood stew with coconut milk and spices.', 16),
('Curry Goat', 'curry_goat.jpg', 12.99, 'Caribbean goat stew cooked with curry spices.', 17),
('Pretzel', 'pretzel.jpg', 4.50, 'German twisted bread with coarse salt.', 18),
('Pelmeni', 'pelmeni.jpg', 8.99, 'Russian dumplings filled with meat and served with sour cream.', 19),
('Tagine', 'tagine.jpg', 12.50, 'Moroccan slow-cooked stew with meat and dried fruits.', 20),
('Penne Alfredo', 'penne_alfredo.jpg', 11.50, 'Italian pasta in a creamy Alfredo sauce.', 1),
('Dim Sum', 'dim_sum.jpg', 15.99, 'Chinese steamed dumplings with various fillings.', 2),
('Enchiladas', 'enchiladas.jpg', 9.99, 'Mexican rolled tortillas with cheese and sauce.', 3),
('Saag Paneer', 'saag_paneer.jpg', 11.99, 'Indian dish with spinach and paneer cheese.', 4),
('Tempura', 'tempura.jpg', 10.50, 'Japanese deep-fried vegetables and seafood.', 5),
('Tabbouleh', 'tabbouleh.jpg', 7.50, 'Mediterranean salad with parsley, tomatoes, and bulgur.', 13),
('Massaman Curry', 'massaman_curry.jpg', 12.99, 'Thai curry with beef, potatoes, and peanuts.', 7),
('Ratatouille', 'ratatouille.jpg', 13.50, 'French vegetable stew with zucchini, eggplant, and tomatoes.', 8),
('Churros', 'churros.jpg', 5.99, 'Spanish fried dough pastry sprinkled with sugar.', 9),
('Pulled Pork Sandwich', 'pulled_pork.jpg', 8.99, 'American sandwich with slow-cooked shredded pork.', 10),
('Vietnamese Spring Rolls', 'vietnamese_spring_rolls.jpg', 6.99, 'Fresh rolls with shrimp, vegetables, and herbs.', 11),
('Japchae', 'japchae.jpg', 9.50, 'Korean stir-fried glass noodles with vegetables.', 12),
('Spanakopita', 'spanakopita.jpg', 10.99, 'Greek pie with spinach and feta cheese.', 13),
('Doner Kebab', 'doner_kebab.jpg', 7.99, 'Turkish street food with meat sliced from a vertical rotisserie.', 14),
('Manakeesh', 'manakeesh.jpg', 6.50, 'Lebanese flatbread topped with zaatar and olive oil.', 15),
('Picanha', 'picanha.jpg', 14.99, 'Brazilian grilled beef cut, popular in churrascarias.', 16),
('Ackee and Saltfish', 'ackee_saltfish.jpg', 13.99, 'Caribbean dish with salted cod and ackee fruit.', 17),
('Schnitzel', 'schnitzel.jpg', 11.50, 'German breaded and fried meat cutlet.', 18),
('Olivier Salad', 'olivier_salad.jpg', 7.99, 'Russian salad with potatoes, carrots, peas, and mayonnaise.', 19),
('Chicken Tagine', 'chicken_tagine.jpg', 12.50, 'Moroccan stew with chicken, olives, and preserved lemons.', 20),
('Fettuccine Alfredo', 'fettuccine_alfredo.jpg', 12.50, 'Italian pasta in a creamy Alfredo sauce.', 1),
('Egg Rolls', 'egg_rolls.jpg', 6.99, 'Chinese rolls filled with cabbage and meat, deep-fried.', 2),
('Guacamole', 'guacamole.jpg', 4.99, 'Mexican avocado dip with tomatoes, onions, and lime.', 3),
('Rogan Josh', 'rogan_josh.jpg', 13.50, 'Indian curry with tender lamb and aromatic spices.', 4),
('Tempura Udon', 'tempura_udon.jpg', 11.99, 'Japanese thick noodles in broth with tempura shrimp.', 5),
('Fattoush', 'fattoush.jpg', 8.50, 'Mediterranean salad with crispy pita and fresh vegetables.', 13),
('Tom Yum Soup', 'tom_yum.jpg', 9.50, 'Spicy Thai soup with shrimp, mushrooms, and lemongrass.', 7),
('Croque Monsieur', 'croque_monsieur.jpg', 10.50, 'French grilled ham and cheese sandwich.', 8),
('Patatas Bravas', 'patatas_bravas.jpg', 6.99, 'Spanish crispy potatoes with spicy tomato sauce.', 9),
('Hot Dog', 'hot_dog.jpg', 5.50, 'American sausage served in a bun with ketchup and mustard.', 10),
('Bun Cha', 'bun_cha.jpg', 7.99, 'Vietnamese grilled pork served with noodles and herbs.', 11),
('Tteokbokki', 'tteokbokki.jpg', 8.50, 'Korean spicy rice cakes stir-fried with vegetables.', 12),
('Gyro', 'gyro.jpg', 9.99, 'Greek wrap with meat, tzatziki, and vegetables.', 13),
('Turkish Delight', 'turkish_delight.jpg', 5.99, 'Turkish confectionery made with sugar and starch.', 14),
('Baklava', 'baklava_2.jpg', 7.50, 'Lebanese pastry with layers of nuts and honey syrup.', 15),
('Feijoada Completa', 'feijoada_completa.jpg', 15.50, 'Brazilian black bean stew served with rice and sides.', 16),
('Saltfish Fritters', 'saltfish_fritters.jpg', 7.50, 'Caribbean appetizer with salted cod and spices.', 17),
('Kaiserschmarrn', 'kaiserschmarrn.jpg', 8.99, 'German shredded pancake served with fruit compote.', 18),
('Pelmeni with Butter', 'pelmeni_butter.jpg', 9.99, 'Russian dumplings tossed in butter and herbs.', 19),
('Chicken Couscous', 'chicken_couscous.jpg', 12.50, 'Moroccan couscous served with chicken and vegetables.', 20);


-- Tạo bảng order
CREATE TABLE order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (food_id) REFERENCES food(food_id) ON DELETE CASCADE   
);
-- insert data order
INSERT INTO order (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 5, 2, 'ORD001', '1,2,3'),
(2, 3, 1, 'ORD002', '4,5'),
(3, 7, 4, 'ORD003', '6,7,8,9'),
(4, 2, 3, 'ORD004', '10,11'),
(5, 1, 1, 'ORD005', '12'),
(6, 8, 2, 'ORD006', '13,14'),
(7, 9, 1, 'ORD007', '15'),
(8, 10, 5, 'ORD008', '16,17,18,19,20'),
(9, 4, 2, 'ORD009', '21,22'),
(10, 6, 3, 'ORD010', '23,24,25'),
(1, 8, 2, 'ORD011', '26,27'),
(2, 1, 1, 'ORD012', '28'),
(3, 2, 4, 'ORD013', '29,30,31,32'),
(4, 5, 3, 'ORD014', '33,34,35'),
(5, 3, 2, 'ORD015', '36,37'),
(6, 7, 1, 'ORD016', '38'),
(7, 6, 2, 'ORD017', '39,40'),
(8, 4, 5, 'ORD018', '41,42,43,44,45'),
(9, 10, 1, 'ORD019', '46'),
(10, 9, 3, 'ORD020', '47,48,49'),
(1, 6, 2, 'ORD021', '50,51'),
(2, 3, 1, 'ORD022', '52'),
(3, 1, 4, 'ORD023', '53,54,55,56'),
(4, 8, 3, 'ORD024', '57,58,59'),
(5, 7, 2, 'ORD025', '60,61'),
(6, 2, 1, 'ORD026', '62'),
(7, 5, 2, 'ORD027', '63,64'),
(8, 9, 5, 'ORD028', '65,66,67,68,69'),
(9, 4, 1, 'ORD029', '70'),
(10, 10, 3, 'ORD030', '71,72,73');

-- res
CREATE TABLE rate_res (
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (res_id) REFERENCES restaurants(res_id) ON DELETE CASCADE
);

INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES
    (1, 1, 5, '2024-09-01 12:00:00'),
    (2, 2, 4, '2024-09-02 13:30:00'),
    (3, 3, 3, '2024-09-03 14:00:00'),
    (4, 7, 5, '2024-09-04 15:15:00'),
    (5, 8, 2, '2024-09-05 16:45:00'),
    (6, 9, 4, '2024-09-06 17:00:00'),
    (7, 10, 3, '2024-09-07 18:30:00'),
    (8, 4, 5, '2024-09-08 19:15:00'),
    (9, 5, 4, '2024-09-09 20:00:00'),
    (10,6, 2, '2024-09-10 21:30:00');

-- Create the like_res table
CREATE TABLE like_res (
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (res_id) REFERENCES restaurants(res_id) ON DELETE CASCADE
);


--data like 
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-09-01 09:30:00'),
(2, 2, '2024-09-01 10:00:00'),
(3, 3, '2024-09-01 10:30:00'),
(1, 2, '2024-09-02 11:00:00'),
(2, 1, '2024-09-02 11:30:00'),
(3, 1, '2024-09-02 12:00:00'),
(1, 3, '2024-09-03 12:30:00'),
(2, 3, '2024-09-03 13:00:00'),
(3, 2, '2024-09-03 13:30:00'),
(1, 4, '2024-09-04 14:00:00'),
(2, 5, '2024-09-04 14:30:00'),
(3, 6, '2024-09-04 15:00:00'),
(1, 6, '2024-09-05 15:30:00'),
(2, 5, '2024-09-05 16:00:00'),
(3, 4, '2024-09-05 16:30:00'),
(1, 7, '2024-09-06 17:00:00'),
(2, 8, '2024-09-06 17:30:00'),
(3, 9, '2024-09-06 18:00:00'),
(1, 8, '2024-09-07 18:30:00'),
(2, 7, '2024-09-07 19:00:00'),
(4, 1, '2024-09-07 19:30:00'),
(5, 2, '2024-09-07 20:00:00'),
(6, 3, '2024-09-07 20:30:00'),
(7, 4, '2024-09-08 21:00:00'),
(8, 5, '2024-09-08 21:30:00'),
(9, 6, '2024-09-08 22:00:00'),
(10, 7, '2024-09-08 22:30:00'),
(4, 8, '2024-09-09 23:00:00'),
(5, 9, '2024-09-09 23:30:00'),
(6, 10, '2024-09-10 00:00:00'),
(7, 1, '2024-09-10 00:30:00'),
(8, 2, '2024-09-10 01:00:00'),
(9, 3, '2024-09-10 01:30:00'),
(10, 4, '2024-09-10 02:00:00'),
(4, 5, '2024-09-10 02:30:00'),
(5, 6, '2024-09-10 03:00:00'),
(6, 7, '2024-09-10 03:30:00'),
(7, 8, '2024-09-10 04:00:00'),
(8, 9, '2024-09-10 04:30:00'),
(9, 10, '2024-09-10 05:00:00'),
(10, 1, '2024-09-10 05:30:00'),
(4, 2, '2024-09-10 06:00:00'),
(5, 3, '2024-09-10 06:30:00'),
(6, 4, '2024-09-10 07:00:00'),
(7, 5, '2024-09-10 07:30:00'),
(8, 6, '2024-09-10 08:00:00'),
(9, 7, '2024-09-10 08:30:00'),
(10, 8, '2024-09-10 09:00:00'),
(4, 9, '2024-09-10 09:30:00'),
(5, 10, '2024-09-10 10:00:00');


--tìm 5 người like nhà hàng nhiều nhất 

SELECT 
    u.user_id, 
    u.full_name, 
    COUNT(lr.res_id) AS total_likes
FROM 
    users u
JOIN 
    like_res lr ON u.user_id = lr.user_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    total_likes DESC
LIMIT 5;

-- tìm 2 nhà hàng có lượt like nhiều nhất 
SELECT 
    r.res_id, 
    r.res_name, 
    COUNT(lr.user_id) AS total_likes
FROM 
    restaurants r
JOIN 
    like_res lr ON r.res_id = lr.res_id
GROUP BY 
    r.res_id, r.res_name
ORDER BY 
    total_likes DESC
LIMIT 2;

-- tìm người đã đặt hàng nhiều nhất 
SELECT 
    u.user_id, 
    u.full_name, 
    COUNT(o.food_id) AS total_orders
FROM 
    users u
JOIN 
    `order` o ON u.user_id = o.user_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    total_orders DESC
LIMIT 1;

-- tìm người không hoạt động 

SELECT 
    u.user_id, 
    u.full_name
FROM 
    users u
LEFT JOIN 
    `order` o ON u.user_id = o.user_id
LEFT JOIN 
    like_res lr ON u.user_id = lr.user_id
LEFT JOIN 
    rate_res rr ON u.user_id = rr.user_id
WHERE 
    o.user_id IS NULL 
    AND lr.user_id IS NULL 
    AND rr.user_id IS NULL;
