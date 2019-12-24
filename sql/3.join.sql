-- join

select * from dept;
select * from emp;

select ename,dname,loc
from emp,dept
where emp.deptno = dept.deptno;


select ename,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,dept.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;


select ename,e.deptno,dname,loc
from emp e,dept d
where e.deptno = d.deptno;

--sal > 2000 크면서 deptno가 20인  사원의 이름, sal ,loc 출력

select ename,sal,loc
from emp e,dept d
where e.deptno = d.deptno and sal>2000 and e.deptno = 20;


************************************
-- Ansi join , 표준  :   , => join  where => on
************************************

-- inner join

select ename,e.deptno,dname,loc
from emp e join dept d
on e.deptno = d.deptno;

select ename,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,loc
from emp e join dept d
on e.deptno = d.deptno 
where sal>2000 and e.deptno = 20;

-- outer join 
-- null 쪽에  + 마킹 

select ename,d.deptno,dname,loc
from emp e,dept d
where e.deptno(+) = d.deptno;

-- Ansi join : outer join 
-- right 쪽의 테이블이 마스터 테이블이 된다.

select ename,d.deptno,dname,loc
from emp e right outer join dept d
on e.deptno = d.deptno;

-- outer 생략
select ename,d.deptno,dname,loc
from emp e right join dept d
on e.deptno = d.deptno;


*************************
-- non equi join
*************************
select * from salgrade; 

-- oracle join
select ename,sal,grade
from emp,salgrade 
where sal between losal and hisal;

-- ansi join
select ename,sal,grade
from emp join salgrade 
on sal between losal and hisal;

*************************
-- n개의 테이블 join
*************************
-- 사원명 , sal , 부서이름 , grade 출력

-- oracle join
select ename,sal,dname , grade
from emp e, dept d , salgrade 
where e.deptno = d.deptno 
and sal between losal and hisal;


-- ansi join
select ename,sal,dname , grade
from emp e 
	 join dept d  
	 on e.deptno = d.deptno 
	 join salgrade
	 on sal between losal and hisal;

-- sal > 1500 이상인 사원명 , sal , 부서이름 , grade 출력
select ename,sal,dname , grade
from emp e 
	 join dept d  
	 on e.deptno = d.deptno 
	 join salgrade
	 on sal between losal and hisal
where sal>1500;

***********************
  oracle self join
***********************
-- 사원의 이름과 그사원의 상사이름 출력 

select e.ename "사원명",m.ename "상사이름"
from emp e,emp m
where e.mgr = m.empno;

select e.ename "사원명",m.ename "상사이름"
from emp e,emp m
where e.mgr = m.empno(+);

select e.ename "사원명" , e.sal,m.ename "상사이름",m.sal
from emp e,emp m
where e.mgr = m.empno and e.sal >= m.sal;

-- ansi join
select e.ename "사원명",m.ename "상사이름"
from emp e join emp m
on e.mgr = m.empno;

select e.ename "사원명",m.ename "상사이름"
from emp e left join emp m
on e.mgr = m.empno;

select e.ename "사원명" , e.sal,m.ename "상사이름",m.sal
from emp e join emp m
on e.mgr = m.empno 
where e.sal >= m.sal;


-- 집계함수
select ename, round(sal) from emp;

select ename , avg(sal) from emp; X

select round(avg(sal))||'원' 전체평균급여 from emp;

select deptno,round(avg(sal)) from emp group by deptno;















