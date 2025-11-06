/*
    04_Distinct
    - 중복 컬럼 값을 제거 후 조회
    - 테이블 내에 명단, 중복되지 않은 데이터의 개수 등을 파악할 때 사용
*/

-- 메뉴 테이블에 존재하는 모든 카테고리 코드의 종류를 조회
select
   distinct category_code
from
    tbl_menu;

-- 컬럼 값 중 null이 존재하는 컬럼에 사용
-- 결과 : null도 1개만 조회
select
    distinct ref_category_code
from
    tbl_category;

-- ref_category_code의 종류를 모두 조회
select
    distinct ref_category_code
from
    tbl_category
where
    ref_category_code is not null;


-- 여러 컬럼(다중 열)에서 distinct 적용
-- 모든 컬럼 값이 같은 경우 중복 제거
select
    distinct category_code, orderable_status
from tbl_menu;

