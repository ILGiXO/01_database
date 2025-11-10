/* Q1.
부서별 직원 급여의 총합 중 가장 큰 액수를 출력하세요. */
SELECT d.DEPT_TITLE, SUM(e.SALARY) "총합"
FROM employee e
JOIN department d ON (e.DEPT_CODE = d.DEPT_ID)
GROUP BY e.DEPT_CODE
ORDER BY `총합` desc
LIMIT 0, 1;
/* Q2.
서브쿼리를 이용하여 영업부인 직원들의 사원번호, 직원명, 부서코드, 급여를 출력하세요.
참고. 영업부인 직원은 부서명에 ‘영업’이 포함된 직원임 */
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM employee
WHERE DEPT_CODE IN (SELECT DEPT_ID FROM department WHERE DEPT_TITLE LIKE '%영업%');


/* Q3.
서브쿼리와 JOIN을 이용하여 영업부인 직원들의 사원번호, 직원명, 부서명, 급여를 출력하세요. */
SELECT *
FROM employee e
JOIN (SELECT * FROM department  WHERE DEPT_TITLE LIKE '%영업%') d ON (e.DEPT_CODE = d.DEPT_ID);


/* Q4.
1. JOIN을 이용하여 부서의 부서코드, 부서명, 해당 부서가 위치한 지역명, 국가명을 추출
하는 쿼리를 작성하세요.*/
WITH deptcode AS (
SELECT e.DEPT_CODE , d.DEPT_TITLE "부서명", l.LOCAL_NAME "지역명", n.NATIONAL_NAME
FROM employee e
JOIN department d ON e.DEPT_CODE = d.DEPT_ID
JOIN location l ON d.LOCATION_ID = l.LOCAL_CODE
JOIN national n ON l.NATIONAL_CODE = n.NATIONAL_CODE
)
/*
2. 위 1에서 작성한 쿼리를 서브쿼리로 활용하여 모든 직원의 사원번호, 직원명, 급여, 부서
명, (부서의) 국가명을 출력하세요.
단, 국가명 내림차순으로 출력되도록 하세요. */
SELECT e.EMP_ID, e.EMP_NAME, e.SALARY, e.DEPT_CODE, d.NATIONAL_NAME
FROM employee e
JOIN deptcode d ON e.DEPT_CODE = d.DEPT_CODE
ORDER BY d.NATIONAL_NAME desc;



/* Q5.
러시아에서 발발한 전쟁으로 인해 정신적피해를 입은 직원들에게 위로금을 전달하려고 합
니다. 위로금은 각자의 급여에 해당 직원의 급여 등급에 해당하는 최소 금액을 더한 금액으로
정했습니다.
Q4에서 작성한 쿼리를 활용하여 해당 부서의 국가가 ‘러시아’인 직원들을 대상으로, 직원의
사원번호, 직원명, 급여, 부서명, 국가명, 위로금을 출력하세요.
단, 위로금 내림차순으로 출력되도록 하세요.*/
SELECT * FROM employee;
SELECT * FROM sal_grade;
SELECT * FROM department;
SELECT * FROM location;
SELECT * FROM national;
-- 본인 급여 + 급여 등급에 최소 금액
SELECT e.EMP_ID,e.EMP_NAME,e.SALARY, d.DEPT_TITLE ,n.NATIONAL_NAME,(e.SALARY + s.MIN_SAL) "위로금"
FROM employee e
JOIN sal_grade s ON e.SAL_LEVEL = s.SAL_LEVEL
JOIN department d  ON e.DEPT_CODE = d.DEPT_ID
JOIN location l ON d.LOCATION_ID = l.LOCAL_CODE
JOIN national n ON l.NATIONAL_CODE =n.NATIONAL_CODE
WHERE n.NATIONAL_NAME LIKE '러시아'
ORDER BY `위로금` desc;

/*
Q3.
단합을 위한 사내 체육대회를 위하여 팀을 꾸리는 중입니다. 기술지원부의 대리, 인사관리부
의 사원, 영업부(팀명에 ‘영업’이 포함되면 영업부로 봄)의 부장을 한 팀으로 묶으려고 합니
다. 이때, 이 팀의 팀원 수를 출력하세요.
단, UNION과 SUBQUERY를 활용하여 출력하세요.
*/

SELECT * FROM employee;
SELECT * FROM department;




