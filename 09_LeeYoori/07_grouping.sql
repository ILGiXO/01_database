/*
    07. grouping
    1) group by
    - 결과 집합을 특정 컬럼 값에 따라 그룹화시킴
*/

/*
    그룹 함수
    - 전체 T 또는 group이 지어진 결과 집합에 사용 가능한 함수
    - count(), sum(), min(), max(), avg()
*/

select category_code, count(*)  -- 카테고리 코드로 그룹화 된 개수가 몇개인지 그룹화
from tbl_menu
group by category_code;

-- group by 없이 group 함수 사용
-- 테이블 전체 == 한 그룹
select count(*)
from tbl_menu;  -- 전체 메뉴 개수 조회

-- count 함수 특징
select count(*), -- * : 모든 행
       count(category_code), -- 컬럼명 기재 : 지정된 컬럼에 값의 개수(null 제외)
       count(ref_category_code)
from tbl_category;


-- sum, avg 확인
select category_code,
       count(*),
       sum(menu_price),
       avg(menu_price),
       max(menu_price),
       min(menu_price)
from tbl_menu
group by category_code;

-- practice 계정
-- 대소비교는 숫자, 문자, 날짜 가능
-- 문자 : A < Z
-- 한글 : ㄱ < ㅎ
-- 날짜 : 과거 < 미래

select
    min(EMP_NAME),
    max(EMP_NAME),
    min(HIRE_DATE) as '가장 빠른 입사일',
    max(HIRE_DATE) as '가장 최근 입사일'
from EMPLOYEE;


-- swcamp 계정
/*
    group 내 group 만들기
    - 큰 그룹 내 소규모 그룹 구성
*/

select
    category_code,
    menu_price,
    menu_name,
    count(*)    -- Group by 가장 끝에 작성된 group을 기준으로 함수가 수행됨
from tbl_menu
group by category_code, menu_price;
-- 오른쪽에 작성될 수록 왼쪽 그룹에 포함된 소규모 그룹
-- group by 절에 작성되지 않은 조건을 select문에 작성하면 오류가 발생하거나 정확하지 않은 값이 나옴
-- > group by 절에 언급되지 않은 컬럼명을 select절에 일반 작성하면 정확한 값이 출력되지않는다
-- select절에 보고싶은 컬럼이 있으면 group by절에 작성해야함(중요)

select count(*)
from tbl_menu
where category_code = 10

/**
  2. having
  /
  - group by로 만들어진 그룹에 대한 조건을 작성하는 절
  - having절에는 group 함수가 반드시 포함된다
 */

 select category_code,
        sum(menu_price)
 from tbl_menu
 group by category_code
 having sum(menu_price) < 50000;

/*
    where : 행 필터링
    having : group 필터링
*/

select
    category_code,
    sum(menu_price)
from tbl_menu
where menu_price > 10000
 group by category_code
 having
     sum(menu_price) > 50000
order by category_code


select
    category_code,
    sum(menu_price)
from tbl_menu
group by category_code
with rollup ;

select
    menu_price,
    category_code,
    sum(menu_price)
from tbl_menu
group by menu_price, category_code
with rollup;
-- rollup은 중간 합계, 총 합계 조회



-- grouping set
-- rollup


SELECT
    a.category_code AS '코드',
    b.category_name '카테고리명',
    AVG(a.menu_price) AS '평균금액'
FROM
    tbl_menu a
        JOIN
    tbl_category b
    ON
        a.category_code = b.category_code
GROUP BY
    a.category_code, b.category_name
HAVING
    AVG(a.menu_price) >= 8000
ORDER BY
    평균금액 ASC
LIMIT 0,3;
-- 메뉴 카테고리별로 그룹을 묶었을때 가격평균이 8000이 되는 평균금액이 가장 낮은 평균 3개를 톱아본 것
