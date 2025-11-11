-- students 테이블
CREATE TABLE IF NOT EXISTS students(
    student_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    class VARCHAR(100),
    PRIMARY KEY (student_id)

);

CREATE TABLE IF NOT EXISTS grades(
    grade_id INT,
    student_id INT,
    subject VARCHAR(100),
    grade CHAR(20),
    PRIMARY KEY (grade_id),
    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

SELECT * FROM students;

 INSERT INTO students(name, class) VALUES
('홍길도','A'),
('신사임당','B'),
('유관순','A');

 INSERT INTO grades(student_id,subject,grade)
 VALUES
(1,'수학','B'),
(1,'과학','A'),
(2,'수학','C'),
(2,'과학','B'),
(3,'수학','A'),
(3,'과학','B');

CREATE OR REPLACE VIEW students_grades AS
SELECT g.subject, s.name, s.class, g.grade
FROM students s JOIN grades g  ON s.student_id = g.student_id
ORDER BY g.subject;

SELECT * FROM students_grades;

CREATE INDEX idx_dept ON employee(dept_code);
SHOW INDEX FROM employee;
-- 인덱스 삭제
DROP INDEX idx_dept ON employee;
ALTER TABLE employee DROP INDEX idx_dept;

DELIMITER //
CREATE OR REPLACE PROCEDURE addNumbers(
    IN num1 INT1,
    IN num2 INT,
    OUT sum INT
)
BEGIN
    SET sum = num1 + num2;
end //
DELIMITER ;

set @result = 0;
CALl addNumbers(10,20,@result);
select @result;


-- 4번
DELIMITER //

CREATE OR REPLACE FUNCTION increasePrice(
    current_price DECIMAL(10,2),
    increase_rate DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN current_price * (1 + increase_rate);
END//

DELIMITER ;

SELECT
    menu_name 메뉴명,
    menu_price 기존가,
    TRUNCATE(increasePrice(menu_price, 0.1), -2) 예정가
FROM
    tbl_menu;

-- 5번
CREATE TABLE salary_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY ,
    emp_id VARCHAR(3),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATETIME,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

DESC salary_history;


-- TRIGGER 생성
/*

employee 테이블의 salary가 수정되기 전에 트리거가 동작해야 한다!-> 그래야지 수정 전 값을 기록할 수 있기 때문!*/

DELIMITER //

CREATE OR REPLACE TRIGGER trg_salary_update
    BEFORE UPDATE ON employee
    FOR EACH ROW
BEGIN

    INSERT INTO salary_history(
           emp_id, old_salary, new_salary, change_date)
    VALUES (OLD.emp_id, OLD.salary,
            NEW.salary, NOW());
end //

DELIMITER ;

UPDATE employee
SET SALARY = 9000000
WHERE emp_id = 200;

SELECT emp_id, emp_name, salary
FROM employee
WHERE emp_id = 200;

SELECT * FROM salary_history;

