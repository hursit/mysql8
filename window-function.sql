# https://www.mysqltutorial.org/wp-content/uploads/2018/09/mysql-window-functions-frame-clause-bound.png

CREATE TABLE t_win(x int AUTO_INCREMENT PRIMARY KEY);


INSERT INTO t_win
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);


SELECT *
FROM t_win;


SELECT x,
       sum(x) OVER ()
FROM t_win;


SELECT x,
       count(x) OVER (), sum(x) OVER ()
FROM t_win;


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS ();


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS UNBOUNDED preceding);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN CURRENT ROW AND CURRENT ROW);

;


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING);


SELECT x,
       count(*) OVER w,
                     count(x) OVER w,
                                   sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN 1 preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (ROWS BETWEEN 3 preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (
                        ORDER BY x);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (
                        ORDER BY x RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM t_win WINDOW w AS (
                        ORDER BY x RANGE CURRENT ROW);


CREATE TABLE generate_1_to_5_x2 AS
SELECT ceil(x/2.0) AS x
FROM t_win
SELECT *
FROM generate_1_to_5_x2;


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS ();


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);

;


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW);

;


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x RANGE CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x ROWS CURRENT ROW);


SELECT x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x);


SELECT x >=3,
       x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x>= 3);


SELECT cast(x >=3 AS signed),
       x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x>= 3);


SELECT x >=3,
       x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x>= 3
                                     ORDER BY x);


SELECT x >=3,
       x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x>= 3
                                     ORDER BY x RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);

;


SELECT x >=3,
       x,
       count(x) OVER w,
                     sum(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x>= 3
                                     ORDER BY x ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       row_number() OVER w
FROM generate_1_to_5_x2 WINDOW w AS ();


SELECT x,
       lag(x, 1) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       lag(x, 2) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       lag(x, 2) OVER w,
                      lead(x, 2) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       first_value(x) OVER w,
                           last_value(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       first_value(x) OVER w,
                           last_value(x) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x ROWS BETWEEN UNBOUNDED preceding AND UNBOUNDED FOLLOWING);


SELECT x,
       nth_value(x, 3) OVER w,
                            nth_value(x, 7) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       nth_value(x, 3) OVER w,
                            nth_value(x, 7) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       nth_value(x, 3) OVER w,
                            nth_value(x, 7) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x ROWS BETWEEN UNBOUNDED preceding AND UNBOUNDED FOLLOWING);


SELECT x,
       rank() OVER w,
                   dense_rank() OVER w
FROM generate_1_to_5_x2 WINDOW w AS ();


SELECT x,
       rank() OVER w,
                   dense_rank() OVER w
FROM generate_1_to_5_x2 WINDOW w AS (RANGE BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       rank() OVER w,
                   dense_rank() OVER w
FROM generate_1_to_5_x2 WINDOW w AS (ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW);


SELECT x,
       rank() OVER w,
                   dense_rank() OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER BY x);


SELECT x,
       cast((percent_rank() OVER w) AS decimal(4, 2)),
       cast((cume_dist() OVER w) AS decimal(4, 2)),
       ntile(3) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (
                                     ORDER
BY x);


SELECT (x >= 3), x,
                 rank() OVER w,
                             dense_rank() OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x >= 3
                                     ORDER BY x)
ORDER BY 1,
         2;


SELECT (x >= 3), x,
                 cast(percent_rank() OVER w AS decimal(4, 2)),
                 cast(cume_dist() OVER w AS decimal(4, 2)),
                 ntile(3) OVER w
FROM generate_1_to_5_x2 WINDOW w AS (PARTITION BY x >= 3
                                     ORDER BY x)
ORDER BY 1,
         2;


CREATE TABLE emp (id int unsigned AUTO_INCREMENT PRIMARY KEY,
                                                         name TEXT NOT NULL,
                                                                   department TEXT, salary decimal(10, 2));


INSERT INTO emp (name, department, salary)
VALUES ('Andy', 'Shipping', 5400),
       ('Betty', 'Marketing', 6300),
       ('Tracy', 'Shipping', 4800),
       ('Mike', 'Marketing', 7100),
       ('Sandy', 'Sales', 5400),
       ('James', 'Shipping', 6600),
       ('Carol', 'Sales', 4600);


SELECT *
FROM emp
ORDER BY id;


SELECT count(*),
       sum(salary),
       round(avg(salary), 2) AS AVG
FROM emp;


SELECT department,
       count(*),
       sum(salary),
       round(avg(salary), 2) AS AVG
FROM emp
GROUP BY department
ORDER BY department;


SELECT department,
       count(*),
       sum(salary),
       round(avg(salary), 2) AS AVG
FROM emp
GROUP BY department WITH ROLLUP
ORDER BY department;

// NULL IS FIRST in mysql
SELECT name,
       salary
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       sum(salary) OVER ()
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       round(salary / sum(salary) OVER () * 100, 2) AS pct
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       sum(salary) OVER (
                         ORDER BY salary DESC ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW)
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       round(avg(salary) OVER (), 2) AS AVG
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       round(avg(salary) OVER (), 2) AS AVG,
       round(salary - avg(salary) OVER (), 2) AS diff_avg
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       salary - lead(salary, 1) OVER (
                                      ORDER BY salary DESC) AS diff_next
FROM emp
ORDER BY salary DESC;


SELECT name,
       salary,
       salary - last_value(salary) OVER w AS
MORE,
                                        round((salary - last_value(salary) OVER w) / last_value(salary) OVER w * 100) AS pct_more
FROM emp WINDOW w AS (
                      ORDER BY salary DESC ROWS BETWEEN UNBOUNDED preceding AND UNBOUNDED FOLLOWING)
ORDER BY salary DESC;


SELECT name,
       salary,
       rank() OVER s,
                   dense_rank() OVER s
FROM emp WINDOW s AS (
                      ORDER BY salary DESC)
ORDER BY salary DESC;


SELECT name,
       department,
       salary,
       round(avg(salary) OVER (PARTITION BY department), 2) AS AVG,
       round(salary - avg(salary) OVER (PARTITION BY department), 2) AS diff_avg
FROM emp
ORDER BY department,
         salary DESC;


SELECT name,
       department,
       salary,
       round(avg(salary) OVER d, 2) AS AVG,
       round(salary - avg(salary) OVER d, 2) AS diff_avg
FROM emp WINDOW d AS (PARTITION BY department)
ORDER BY department,
         salary DESC;


SELECT name,
       department,
       salary,
       salary - lead(salary, 1) OVER (PARTITION BY department
                                      ORDER BY salary DESC) AS diff_next
FROM emp
ORDER BY department,
         salary DESC;


SELECT name,
       department,
       salary,
       rank() OVER s AS dept_rank,
                   rank() OVER (
                                ORDER BY salary DESC) AS global_rank
FROM emp WINDOW s AS (PARTITION BY department
                      ORDER BY salary DESC)
ORDER BY department,
         salary DESC;
