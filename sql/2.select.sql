conn SCOTT/TIGER 

select * from emp;
select * from dept;
select * from salgrade;

desc emp;

select ename,sal,deptno
from emp;

select ename,hiredate
from emp;

select deptno,dname 
from dept;

select distinct job
from emp;

select ename, sal,sal*12
from emp;

select ename, sal,sal*12 "년봉"
from emp;

select ename, job, sal, comm
from emp;
 
select ename, job, sal, comm, sal+nvl(comm, 0) as "총 급여"
from emp;

select empno, ename, mgr
from emp;

select empno, ename,nvl(to_char(mgr), '<<CEO>>') as 매니저코드
from emp;


-- 문자 연결 연산자  ||
select ename||'  '||job
from emp;

select 20*20*4
from dept;

select 20*20*4
from dual;

select sysdate
from dual;

select user
from dual;


-- row 제한을 걸때 where 절

select ename, job, deptno
from emp
where deptno = 10;

select ename, job, deptno
from emp
where job='MANAGER';

select ename,job,deptno,
from emp
where lower(job) = lower('manager');

select sysdate
from dual;

select ename,hiredate
from emp
where hiredate <> '81/05/01';

-- between and 작은 값이 앞에 와야함
select ename, sal
from emp
where sal between 2450 and 3000;
-- in 연산자
select ename,job,deptno
from emp
where deptno = 10 or deptno = 20;

select ename,job,deptno
from emp
where deptno in(10,20);

select *
from dept
where (deptno,loc) in((20, 'DALLAS'),(30, 'CHICAGO'));

--like 연산자

select * 
from emp
where ename = 'A';

select * 
from emp
where ename like '%A%';

select * 
from emp
where ename like '%A__';

select *
from emp
where upper(ename) like upper ('%A%';)

--81년도에 입사한 사원 목록
select *
from emp
where hiredate like '81%';

-- where null
select *
from emp
where mgr is null;

select *
from emp
where mgr is not null;

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
where sal+nvl(comm,0) >= 2000

-- 정렬
select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
order by sal desc;

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
order by sal asc;

select ename,sal,comm,sal+nvl(comm,0) as "총급여"
from emp
where comm is not null
order by sal asc, comm desc;

select ename,sal,sal+nvl(comm,0) as "총급여"
from emp
where sal+nvl(comm,0) >= 2000
order by "총급여";


select ename,sal,sal+nvl(comm,0) as "총급여"
from emp
where sal+nvl(comm,0) >= 2000
order by 3;

-- 단일행 함수
select dname, lower(dname), loc, lower(loc)
from dept;

select round(44,55),round(44,55,1),trunc(44,55) from dual;

select sal, sal*0.03 as "TAX"
from emp

-- 사원의 입사 월 정보 추출
select ename,hiredate,substr(hiredate,1,2)
from emp;

select ename,hiredate,substr(hiredate,4,2) as 입사월
from emp;

-- 사원의 입사 월이 12인 정보만 추출
select ename,hiredate,substr(hiredate,4,2) as 입사월
from emp;
where substr(hiredate,4,2) = '12';

select ename,hiredate 입사일
from emp;
where substr(hiredate,4,2) = '12';



