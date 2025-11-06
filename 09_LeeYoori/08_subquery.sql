/*
    08. subquery
    - main query 내에서 실행되는 보조 query(select)
    - 종류 : 단일 행, 다중 행, 다중 열, 단일 행 다중 열, 스칼라 서브쿼리, 상관 서브쿼리, 인라인 뷰
    - 서브쿼리를 위한 연산자 : exists
*/

-- 서브쿼리 예시
-- '민트미역국'과 같은 카테고리의 메뉴를 모두 조회하시오

select *
from tbl_menu
where menu_name = '민트미역국';

select menu_name, category_code
from tbl_menu
where category_code = (
        select  category_code
        from    tbl_menu
        where   menu_name = '민트미역국'
    );