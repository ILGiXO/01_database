/*
    select 해석 순서
    5. select
    1. from
    2. where
    3. group by
    4. having
    6. order by
    7. limit
*/

/*
    limit : select 조회 결과 집합(result set)
    원하는 행의 개수를 제한하여 반환
*/
-- limit [offset], rowcount
-- offset : 시작할 행의 번호
-- row_count : 행의 개수
-- top-n 분석
select *
from tbl_menu
order by menu_price desc
limit 5;

-- 중간에 원하는 행만 조회
select menu_code,
       menu_price,
       menu_name
from tbl_menu
order by menu_price desc, menu_name asc
limit 5, 8;