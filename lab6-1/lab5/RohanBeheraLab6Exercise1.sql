--Find the total number of parts supplied by each supplier
SELECT DISTINCT C.sid, COUNT(*)
FROM Catalog C
GROUP BY C.sid; 

--Find the total number of parts supplied by each supplier who supplies at least 3 parts
SELECT DISTINCT C.sid, COUNT(*)
FROM Catalog C
GROUP BY C.sid
HAVING COUNT(*) > 2;

-- For every supplier that supplies only green parts, print the name of the 
--supplier and the total number of parts that he supplies--
SELECT DISTINCT S.sname, COUNT(*)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green'
GROUP BY  S.sname, P.pid;

--For every supplier that supplies green part and red part, print 
--the name of the supplier and the price of the most expensive part
--that he supplies
SELECT S.sname, MAX(C.cost)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid
GROUP BY S.sname, S.sid, P.color
HAVING (P.color = 'green') AND (P.color = 'red');