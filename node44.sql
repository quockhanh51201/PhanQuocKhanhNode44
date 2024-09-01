CREATE TABLE users (
user_id INT,
full_name VARCHAR(50),
email VARCHAR(50),
pass_word VARCHAR(255)
)

--add data

INSERT INTO users (user_id, full_name, email, pass_word, age) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123', 28),
(2, 'Jane Smith', 'janesmith@example.com', 'password123', 34),
(3, 'Michael Johnson', 'michaelj@example.com', 'password123', 40),
(4, 'Emily Davis', 'emilyd@example.com', 'password123', 25),
(5, 'Chris Brown', 'chrisb@example.com', 'password123', 31),
(6, 'Sarah Wilson', 'sarahw@example.com', 'password123', 27),
(7, 'David Miller', 'davidm@example.com', 'password123', 45),
(8, 'Jessica Taylor', 'jessicat@example.com', 'password123', 22),
(9, 'Daniel Anderson', 'daniela@example.com', 'password123', 33),
(10, 'Laura Thomas', 'laurat@example.com', 'password123', 29),
(11, 'Paul Moore', 'paulm@example.com', 'password123', 36),
(12, 'Anna Jackson', 'annaj@example.com', 'password123', 24),
(13, 'Mark Lee', 'markl@example.com', 'password123', 38),
(14, 'Sophia Harris', 'sophiah@example.com', 'password123', 26),
(15, 'Peter Clark', 'peterc@example.com', 'password123', 32),
(16, 'Olivia Lewis', 'olivial@example.com', 'password123', 30),
(17, 'James Walker', 'jamesw@example.com', 'password123', 42),
(18, 'Linda Young', 'linday@example.com', 'password123', 37),
(19, 'Robert Hall', 'roberth@example.com', 'password123', 50),
(20, 'Susan Allen', 'susana@example.com', 'password123', 28);

SELECT * FROM users
--thêm cột tuổi 
alter TABLE users
ADD COLUMN age INT
--sửa kiểu dữ liệu của full_name
ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(100)

-- tìm người có tuổi từ 25 đến 30
SELECT * FROM users
WHERE age BETWEEN 25 and 30
--tìm người có tên có chữ john
SELECT * FROM users
WHERE full_name like '%John%' and (age = 28)
--sắp xếp tuổi theo thứ tự giảm dần 
SELECT * FROM users
ORDER BY age desc
--lấy 5 thằng đầu tiên 
SELECT * FROM users
LIMIT 5
-- thêm constraijnt cho column
ALTER TABLE users
modify COLUMN full_name VARCHAR(255) not NULL,
modify COLUMN email VARCHAR(50) not NULL,
modify COLUMN pass_word VARCHAR(255) not NULL
-- thêm kháo chính (primary key) cho user_id
ALTER TABLE users
modify COLUMN user_id INT PRIMARY KEY AUTO_INCREMENT
--update data
update users
set full_name = 'Phan Quốc Khánh'
WHERE user_id ='1'

SELECT * FROM users
WHERE user_id = 1
-- delete data
DELETE FROM users
WHERE user_id = 2
-- soft delete -> thêm flag is_deleted để không show data
ALTER TABLE users
add COLUMN is_deleted INT not NULL DEFAULT 1


-- tìm ngươi có tuổi lớn nhất 
SELECT * FROM users
WHERE age = (
SELECT age FROM users
ORDER by age desc 
LIMIT 1
)

-- test gộp commit