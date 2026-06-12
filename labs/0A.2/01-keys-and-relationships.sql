/* =====================================================================
   AIDD-MS-0 · Lesson 0A.2 — Keys and Relationships
   Lesson script:
   https://abbottics-ai.atlassian.net/wiki/spaces/DTA/pages/126189570
   Database: AdventureWorksLT  (schema: SalesLT)

   Goal: see how a *key value* is the thread that connects tables. A primary
   key identifies one row uniquely (Customer.CustomerID, Product.ProductID);
   a foreign key (SalesOrderHeader.CustomerID) is a reference back to it. We
   match by eye here — JOIN syntax that automates this comes in Module 0C.
   ===================================================================== */

-- 1. Primary key in action: CustomerID identifies each customer uniquely.
SELECT CustomerID, FirstName, LastName, CompanyName
FROM SalesLT.Customer;

-- 2. The orders table carries CustomerID as a FOREIGN KEY — a reference to
--    which customer placed each order.
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM SalesLT.SalesOrderHeader;

-- 3. Which customers actually placed orders? These CustomerID values exist in
--    BOTH tables — that overlap is what a relationship means.
SELECT DISTINCT CustomerID
FROM SalesLT.SalesOrderHeader
ORDER BY CustomerID;

-- 4. Pick one CustomerID from query 3 and find that customer's row.
--    (Swap 29847 for any value query 3 returned.)
SELECT CustomerID, FirstName, LastName, CompanyName
FROM SalesLT.Customer
WHERE CustomerID = 29847;

-- 5. That same key value finds the customer's orders — matching tables by
--    hand, the way a JOIN will do for us automatically in Module 0C.
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM SalesLT.SalesOrderHeader
WHERE CustomerID = 29847;

/* A foreign key is a promise that this value exists "over there." Keys are
   exactly what make the joins in Module 0C possible. */
