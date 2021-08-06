
SELECT DISTINCT * FROM emp;

SELECT * FROM emp02;

SELECT DISTINCT e.mgr, m.ename
FROM emp m, emp E 
WHERE e.mgr = m.empno;


SELECT * FROM dept03 ORDER BY deptno DESC;


CREATE TABLE dept03
AS SELECT * FROM dept;

SELECT *
FROM dept03;


INSERT INTO dept03 values(?, ?, ?);


SELECT * FROM dept02;

SELECT * FROM emp02;