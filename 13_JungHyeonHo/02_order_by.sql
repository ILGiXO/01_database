/*  02. ORDER BY
- RESULT SET을 정렬하는 구문
    -> RESULT SET이란?
        SELECT문의 결과 집합 (SELECT 실행해서 조회되는 데이터의 집합)

- 보통 SELECT문 제일 마지막에 작성
- 정렬 방식
    1) ASC 오름차순(ascending)
    2) DESC 내림차순(descending)
*/


-- 가격기준 오름차순, 내림차순
SELECT menu_code, menu_name, menu_price
FROM tbl_menu
ORDER BY menu_price
#     ASC;
    DESC;

-- 문자열 컬럼 기준 오름/내림차순
SELECT menu_code, menu_name, menu_price
FROM tbl_menu
ORDER BY menu_name
# ASC;
    DESC;

-- 컬럼 별로 정렬 기준 설정하기
-- ORDER BY 아래 절들은 순차적으로 정렬한다
-- 1)menu_price 내림차순 =>
-- 2)menu_code 오름차순 =>
-- 3)menu_name 오름차순
SELECT menu_code, menu_name, menu_price
FROM tbl_menu
ORDER BY
    /*1*/menu_price desc,
    /*2*/menu_code asc,
    /*3*/menu_name asc;

SELECT menu_code, menu_name, menu_price
FROM tbl_menu
ORDER BY
    /*1*/menu_price asc,
    /*2*/menu_name desc,
    /*3*/menu_code asc;

/*---------------------------------------------------------------------*/
/*
    ORDER BY절에는 컬럼명 외에
    1)연산 결과, 2)별칭, 3)컬럼 순서 등을 이용할 수 있다
 */
-- 1)연산 결과 사용
SELECT menu_code,
       menu_name,
       menu_price * menu_code
FROM tbl_menu
ORDER BY menu_price * menu_code ASC;

-- 2)별칭 사용
/* (중요) ORDER BY절은 SELECT 해석 이후에 적용된다! */
SELECT menu_code as '메뉴 코드',
       menu_name as '메뉴 이름',
       menu_price * menu_code as `연산 결과`
FROM tbl_menu
ORDER BY `연산 결과` DESC;
-- ORDER BY menu_code DESC;
# ``(백틱) 문자열 모양을 그대로 인식 => '(작은따옴표)와 헷갈리지 말 것


-- 3)컬럼 순서 사용
#컬럼 순서를 사용하는 것은 추천하지 않는다.
#   BCS. SELECT절의 컬럼 순서는 변동성이 강하다! (SELECT 바로 뒤 다른 컬럼 추가)
SELECT menu_code,
       menu_name,
       menu_price
FROM tbl_menu
ORDER BY 2 DESC;

-- +4)NULL 값의 정렬 방식
SELECT * FROM tbl_category;
/*
    ASC 정렬 시 NULL은 무조건 윗쪽
    DESC 정렬 시 NULL은 무조건 아랫쪽

    ORDER BY 대상 컬럼명 앞에 - 추가 시
    정렬 방향이 반대로 바뀜 + NULL 위치는 고정임
 */
SELECT
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY
    -- ref_category_code ASC;   -- NULL 윗쪽, 오름차순
    -- -ref_category_code ASC;  -- !!! NULL은 윗쪽이지만, 값들은 내림차순
    -- ref_category_code DESC;  -- NULL 아랫쪽, 내림차순
    -ref_category_code DESC;    -- !!! NULL 아랫쪽, 값들은 오름차순
/*---------------------------------------------------------------------*/
/*
 FIELD() 함수
 */
SELECT FIELD(1, 3, 2, 1);           -- RESULT = 3
SELECT FIELD('정','호','현','정');      -- RESULT = 3
SELECT FIELD('B','A','C','D','B');  -- RESULT = 4
SELECT FIELD(0, 1, 2, 3);           -- RESULT = 0, 일치하는 값이 없다면 0 반환

-- 1) FIELD() 함수를 이용해 정렬하기
--  => 정렬 우선순위를 orderable_status에 지정했음. 'Y'가 우선
SELECT
    menu_name,
    orderable_status,
    FIELD(orderable_status,'Y','N')
FROM
    tbl_menu
ORDER BY
    FIELD(orderable_status,'Y','N') ASC;
-- 2) 먼저 'Y', 'N' 순으로 정렬 한다
--      이후, DESC
SELECT
    menu_code,
    menu_name,
    orderable_status,
    FIELD(orderable_status,'Y','N')
FROM
    tbl_menu
ORDER BY
    FIELD(orderable_status,'Y','N') ASC,
    menu_code DESC;
