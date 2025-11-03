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

select * from 