-- 01_SELECT : 특정 테이블의 원하는 데이터(행)을 조회하는 구문

-- tbl_menu 테이블의 모든 메뉴이름(menu_name) 조회
/*2*/
SELECT menu_name
/*1*/FROM tbl_menu;

-- 모든 메뉴의 menu_name, menu_code, menu_price 조회
SELECT menu_name,
       menu_code,
       menu_price
FROM tbl_menu;

-- 모든 열 데이터 조회
SELECT menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
FROM tbl_menu;

SELECT *
FROM tbl_menu;

-- 단독 select 활용
-- == 선택할 테이블이 없다
-- == 어떠한 테이블도 조회하려는 데이터를 가지고 있지 않다
select 7+3;
select 7%3; -- 나머지(Modulo,mod);=
select 7/3;

select 7+3,7-3; -- 여러 컬럼 조회도 가능

-- 내장 함수 이용
select now() as 현재시간; -- 현재 시간
# select concat('/홍',' ','길동') as 'full name';-- 내 문자열을 합쳐서 결과 출력
select concat('/홍',' ','길동') as 'full name';
                                             -- 내 문자열을 합쳐서 결과 출력
