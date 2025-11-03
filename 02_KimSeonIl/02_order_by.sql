/* 02. ORDER BY
   - RESULT SET을 정렬하는 구문
   -> RESULT SET이란?
   SELECT 문의 결과 집합(SELECT 실행해서 조회되는 데이터의 집합)

   - 보통 SELECT 문 제일 마지막에 작성

   - 정렬 방식
   1) ASC : 오름차순(ascending)
    2) DESC : 내림차순(decending)
   */

SELECT menu_code, menu_name, menu_price
FROM tbl_menu
# order by menu_price ASC; -- 오름차순
order by menu_price DESC; -- 내림차순


-- 문자열 컬럼 기준 오름/내림차순

SELECT menu_name from tbl_menu
# order by menu_name desc;
order by menu_name asc;

-- 정렬 기준
SELECT menu_code, menu_name, menu_price from tbl_menu
order by menu_price desc, menu_code asc;

--  가격 오름차순, 같으면 이름 오름차순
SELECT menu_code, menu_name, menu_price
from tbl_menu
order by menu_price asc, menu_name asc, menu_code desc;

/*
ORDER BY절에는 컬럼명 외
연산결과, 별칭, 컬럼 순서 등을 이용할수 있다.
*/


-- 컬럼순서 사용(추천 X)
-- 추천하지 않는 이유 : select절의 컬럼순서는 언제든지 바뀔수 있다. 컬럼명 쓰자 그냥
SELECT menu_code, menu_name, menu_price
from tbl_menu
ORDER BY 2 desc; -- RESULT SET 중 2번째 컬람(menu_name)을 내림차순 정렬


-- 연산 결과를 이용한 정렬
SELECT menu_code, menu_price, menu_code * menu_price
from tbl_menu
order by menu_code * menu_price DESC;

-- 별칭을 이용하여 정렬
/*
 (중요) ORDERBY젏은 SELECT절 이후에 적용된다. 서브쿼리에 많이 사용된다.

 */

SELECT menu_code as `메뉴 코드`, menu_price as '메뉴 가격', menu_code* menu_price as '연산 결과'
from tbl_menu
order by `연산 결과` DESC;

-- ``(백틱) 문자열 모양을 그대로 인식함.

-- NULL 값의 정렬 방식
SELECT * FROM tbl_category

/*
 ASC 정렬 시 NULL은 무조건 위
 DESC 정렬 시 NULL은 아래쪽

 ORDER BY 대상 컬럼명 앞에 - 추가 시 정렬 방향이 반대로 바뀐다.
 */

SELECT  category_code, category_name, ref_category_code
from tbl_category
 order by -ref_category_code asc; -- NULL이 위쪽에 있다. 오름차순
# order by ref_category_code asc; -- NULL이 위쪽에 있다. 내름차순
# order by ref_category_code desc; -- NULL이 아래쪽에 있다.
/*
 DB에서 Null은 빈칸을 의미한다.
 */

/*
 field(찾을 값, 목록1, 목록2, ...) 함수
    - 찾을 값이 목록에 존재하면 해당 위치 ( 숫자 )를 반환
     목록에 일치하는 값이 업으면 결과는 0 반환
 */

SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');
SELECT FIELD('C', 'A', 'B', 'C');
SELECT FIELD('D', 'A', 'B', 'C');

-- field() 함수를 이용해 정렬하기
 SELECT menu_name, orderable_status, FIELD(orderable_status, 'Y','N') FROM tbl_menu
 order by FIELD(orderable_status, 'Y','N') ASC;

