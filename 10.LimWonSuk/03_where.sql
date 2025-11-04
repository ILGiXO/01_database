/*
    03_where
    - 테이블에서 특정 조건에 맞는 레코드(행, row)만 선택하는 구문
    - 조건을 나타내기 위한 각종 연산자를 사용
 */

 -- 1) 비교 연산자 (=, !=, <>, <, >, <=, >=)
 -- 컴퓨터에서 부정호(같지않다) = != 이다
    SELECT
        menu_code
        menu_name
        orderable_status
    FROM
        tbl_menu;

-- [ = ] : 값이 일치하는지 확인
    SELECT
    *
    FROM
       tbl_menu
    WHERE
        orderable_status = 'Y'
    ORDER BY
        menu_name ASC;

-- 이름이 '붕어빵초밥'인 메뉴 조합
SELECT
    *
FROM
    tbl_menu
WHERE
    menu_name = '붕어빵초밥';

-- 메뉴 가격이 13000인 메뉴의 메뉴명, 메뉴명을 내림차순으로 조회
/*
SELECT
    *
FROM
    tbl_menu
WHERE
    menu_price = '13000' ASC; -- 내가푼 공식 틀림
*/

SELECT
    *
FROM
    tbl_menu
WHERE
    menu_price = 13000
ORDER BY
    menu_name ASC;
-- [ !=, <> ] 같지 않음
-- 주문가능 상태가 'Y'가 아닌 메뉴의
-- 메뉴코드, 메뉴명, 주문가능 상태를
-- 메뉴명 오름파순으로 조회
SELECT
    menu_code,
    menu_name,
    orderable_status

FROM
    tbl_menu
WHERE
    orderable_status != 'Y'
ORDER BY
    menu_name ASC;

-- 대소비교 (초과, 미만 , 이상, 이하)
-- 메뉴 가격이 20000원 초과인 메뉴의
-- 메뉴명, 가격을
-- 메뉴코드 내림차순으로 조회
SELECT
    *

FROM
    tbl_menu
WHERE
    menu_price > 20000 -- >=, <= 같은 복합기호에서는 등호가 우측
ORDER BY
    menu_code DESC;
---

SELECT
    *

FROM
    tbl_menu
WHERE
    menu_price < 20000 -- 초과 ↔ 이하, 미만 ↔ 이상
ORDER BY
    menu_code DESC;

/*
    2) 논리 연산자
    - 논리란? 참(TRUE), 거짓(FALSE)을 나타내는 값
 */
-- A AND B : A와 B 모두 참(TRUE)인 경우 결과가 TRUE
--  그외 나머지는 모두 거짓 (FALSE)

-- 주문가능한 상태이며, 카테고리 코드가 10에 해당하는 메뉴만 조회
SELECT
    *
FROM
    tbl_menu
WHERE
    orderable_status = 'Y'
AND
    category_code = 10;

-- 메뉴 가격이 5000원 초과이면서
-- 카테고리 번호가 10인 메뉴의
-- 메뉴코드, 메뉴명, 카테고리 코드를
-- 메뉴코드 오름차순으로 조회
SELECT
    *
FROM
    tbl_menu
WHERE
    menu_price > 5000
AND
    category_code = 10
ORDER BY
    menu_code ASC;

-- 메뉴 가격이 5000원 이상 20000원 미만인
-- 메뉴의 메뉴명, 메뉴가격을
-- 메뉴 가격 오름 차순으로 조회
/*
SELECT
    *
FROM
    tbl_menu
WHERE
    5000<= menu_price < 20000 -- 이부분이 오답
ORDER BY
    menu_name DESC;

*/


SELECT
    menu_name,
    menu_price
FROM
    tbl_menu
WHERE
    menu_price >= 5000
AND
    menu_price < 20000
ORDER BY
    menu_name ASC;

-- 메뉴가격이 5000원 이상 20000만원 미만
-- 카테고리 코드가 10인
-- 메뉴의 메뉴명, 메뉴가격, 카테고리코드를
-- 메뉴가격 오름  차순으로 조회
SELECT
    menu_price,
    menu_name,
    category_code
FROM
    tbl_menu
WHERE
   (menu_price >= 5000 AND menu_price < 20000)
AND
    category_code = 10
ORDER BY
    menu_price ASC;

/* A OR B -- 둘다 FALSE인 경우에만 결과가 FALSE
-- 주문가능한 상태 이거나
-- 카테고리코드가 10인 메뉴를 모두 조회
 */
SELECT
    *
FROM
    tbl_menu
WHERE
    orderable_status = 'Y'
OR
    category_code = 10;

-- 범위
SELECT
    menu_price,
    menu_name
FROM
    tbl_menu
WHERE
--   (menu_price < 5000 OR menu_price >= 20000)
    menu_price < 5000
OR
    menu_price >= 20000

ORDER BY
    menu_price ASC;

/*
    AND, OR 연산 중 우선순위는
    AND가 높다 !!!
 */
 -- 흑마늘, 까나리
 SELECT
     *
 FROM
     tbl_menu
 WHERE
     category_code = 4
 OR
     menu_price = 9000
AND
     menu_code > 10;

-- 우선순위 문제 해결시 () 이용 !!
-- 코드의 순서를 바꾸면 오히려 꼬일수있음
-- 코드 4번이며, 가격 9000원 그리고 6이상인애들
SELECT
     *
 FROM
     tbl_menu
 WHERE
     (category_code = 4
 OR
     menu_price = 9000)
AND
     menu_code > 6;

-- 7개
SELECT
     *
 FROM
     tbl_menu
 WHERE
     (category_code = 4
 OR
     menu_price = 9000);