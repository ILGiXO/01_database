-- 01_select: 특정 테이블의 원하는 데이터(행)을 조회하는 구문
/* 범위 주석 (단축키 ctrl + shift + /) */
-- tbl_menu 테이블의 모든 메뉴 이름(menu_name) 조회
/*2*/
SELECT
    menu_name
/*1*/
FROM
    tbl_menu;


-- 모든 메뉴의 menu_code, menu_name, menu_price 조회
SELECT
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu;

-- tbl_menu 테이블 모든 열 조회
SELECT
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu;

-- *(asterisk) == 모든
SELECT
    *
FROM
    tbl_menu;

-- FROM 없이 SELECT 단독 사용
-- == 선택할 테이블이 없다.
-- == 어떠한 테이블도 조회하려는 데이터를 가지고 있지 않다.

SELECT 7 + 3;
SELECT 7 * 3;
SELECT 7 / 3;
SELECT 7 - 3;
SELECT 7 % 3; -- 나머지(Modulo, MOD)

SELECT 7 + 1, 7 -3; -- 여러 컬럼(Column, 열, 세로줄) 조회도 가능

-- 내장 함수 이용
SELECT NOW(); -- 현재 시간
SELECT CONCAT('황','자현'); -- ()내 문자열을 합쳐서 결과 출력

-- 컬럼 별칭 사용
SELECT NOW() AS 현재시간;
SELECT CONCAT('황', '자현') AS 이름;
SELECT CONCAT('황', ' ', '자현') AS 'full name'; -- 띄어쓰기도 문자열


-- menudb 데이터베이스 내 모든 테이블 조회해보기
SELECT * FROM tbl_category;
SELECT category_code, category_name from tbl_category;

