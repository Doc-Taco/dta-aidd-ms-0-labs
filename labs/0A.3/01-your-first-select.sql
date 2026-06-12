/* =====================================================================
   AIDD-MS-0 · Lesson 0A.3 — Your First SELECT
   Lesson script:
   https://abbottics-ai.atlassian.net/wiki/spaces/DTA/pages/126353410
   Database: AdventureWorksLT  (schema: SalesLT)

   Goal: write a real SELECT — choose the columns you need, name them with
   aliases, build expression columns, and use DISTINCT. Notice the formatting
   from the very first statement: keywords up, one clause per line, the column
   list aligned. We name the columns we want (clear intent) rather than *.
   ===================================================================== */

-- 1. Project specific columns from Product — say exactly what you want.
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product;

-- 2. Project specific columns from Customer.
SELECT CustomerID, FirstName, LastName
FROM SalesLT.Customer;

-- 3. Rename output columns with aliases (AS). Brackets allow spaces in a name.
SELECT ProductID AS [Product ID],
       Name      AS ProductName,
       ListPrice AS [List Price]
FROM SalesLT.Product;

-- 4. A computed column: profit margin = list price minus standard cost.
SELECT Name,
       ListPrice,
       StandardCost,
       ListPrice - StandardCost AS Margin
FROM SalesLT.Product;

-- 5. Another expression: a line total on an order-detail row.
SELECT SalesOrderID,
       ProductID,
       OrderQty,
       UnitPrice,
       OrderQty * UnitPrice AS LineTotal
FROM SalesLT.SalesOrderDetail;

-- 6. Build text with concatenation: a full name from two columns.
SELECT FirstName,
       LastName,
       FirstName + ' ' + LastName AS FullName
FROM SalesLT.Customer;

-- 7. DISTINCT removes duplicate rows — here, the distinct product colors.
SELECT DISTINCT Color
FROM SalesLT.Product;

-- 8. DISTINCT again: the distinct sizes products come in.
SELECT DISTINCT Size
FROM SalesLT.Product;

-- 9. Compare * with an explicit column list on the same small table.
SELECT * FROM SalesLT.ProductCategory;

SELECT ProductCategoryID, Name
FROM SalesLT.ProductCategory;

-- 10. Two-part naming (schema.table) plus a short table alias for clarity.
SELECT p.ProductID,
       p.Name,
       p.ListPrice
FROM SalesLT.Product AS p;

/* Next — 0A.4: How SQL Really Runs (logical query processing order), the
   model that explains why WHERE can't see a SELECT alias but ORDER BY can. */
