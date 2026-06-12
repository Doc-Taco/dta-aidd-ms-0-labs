/* =====================================================================
   AIDD-MS-0 · Lesson 0A.1 — The Relational Model: Tables, Rows, Columns
   Lesson script:
   https://abbottics-ai.atlassian.net/wiki/spaces/DTA/pages/125960194
   Database: AdventureWorksLT  (schema: SalesLT)

   Goal: read a result set fluently. A table is a set of rows; every row has
   the same typed columns. This lesson we are only *looking* — no filtering
   yet (that starts in 0B.1). Run each statement and read the grid: the
   column headers are attributes, each row is one instance, each cell a value.
   ===================================================================== */

-- 1. The Customer table: one row per customer, the same columns for every row.
SELECT * FROM SalesLT.Customer;

-- 2. The Product table: a different kind of thing, with its own columns.
SELECT * FROM SalesLT.Product;

-- 3. The SalesOrderHeader table: one row per order (revisited all course).
SELECT * FROM SalesLT.SalesOrderHeader;

-- 4. "How many rows?" COUNT(*) counts the rows in the table.
SELECT COUNT(*) AS CustomerCount
FROM SalesLT.Customer;

-- 5. A set has no inherent order. Run this a few times: the rows may come
--    back in a different order, because we never asked for one. (Lesson 0B.2
--    makes order deliberate with ORDER BY.)
SELECT CustomerID, FirstName, LastName, CompanyName
FROM SalesLT.Customer;

/* Read, don't filter: to "locate a specific customer" this lesson, scroll the
   grid from query 5 and find them by eye. Filtering with WHERE is Lesson 0B.1. */
