-- 01 SELECT : 특정 테이블의 원하는 데이터 (행)을 조회하는 구문

-- tbl_menu 테이블의 모든 메뉴 이름만 조회
/*해석 순서 1 -> 2*/
/*2*/
SELECT menu_name
/*1*/
from tbl_menu;

-- 모든 메뉴의 menu_code, menu_name, menu_price 조회
SELECT menu_name, menu_code, menu_name FROM tbl_menu;

-- tbl_menu 테이블 모든 열 조회
-- *(asterisk) == 모든
SELECT * FROM tbl_menu;

show tables;

create table hi(
    id int primary key auto_increment comment '하이'
);

-- from 없이 단독 select 사용
-- 선택할 테이블이 없다.
-- 어떠한 테이블도 조회하려는데 데이터를 가지고 있지않다.
/*2*/
#  SELECT

/*1 */
#  FROM


SELECT 7 + 3;
SELECT 7 * 3;
SELECT 7 / 3;
SELECT 7 - 3;
SELECT 7 % 3; -- 나머지

SELECT 7 + 3, 7 -3 ; -- 여러컬럼(Column) 조회도 가능하다.

-- 내장함수 이용
SELECT NOW(); -- 현재 시간
SELECT CONCAT('홍', '길동') ;  -- () 내 문자열을 합쳐서 결과 출력

--  column 별칭 사용
SELECT NOW() AS 현재시간;
SELECT CONCAT('홍', '길동') AS 이름 ;
SELECT CONCAT('홍', '길동') AS 'full Name' ;
SELECT CONCAT('홍',' ', '길동') AS 'full Name' ; -- 띄어쓰기도 문자열

-- menudb 데이터 베이스 내 모든 테이블 조회해보기
select * from tbl_menu;
select * from tbl_order;
select * from tbl_category;
SELECT * from tbl_payment;
SELECT * FROM tbl_payment;
SELECT * FROM tbl_payment_order;

 tbl_menu;