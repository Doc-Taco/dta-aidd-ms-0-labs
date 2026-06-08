-- AIDD-MS-0 — your first query against AdventureWorksLT.
--
-- How to run: with this file open, connect using the pre-seeded
-- "AIDD-MS Lab (AdventureWorksLT)" profile (the MSSQL extension will prompt, or
-- pick it from the SQL Server view), then run with the ▶ button or Ctrl/Cmd+Shift+E.
-- You should get rows back immediately — no setup required.

SELECT TOP (10)
    CustomerID,
    Title,
    FirstName,
    LastName,
    CompanyName
FROM SalesLT.Customer
ORDER BY CustomerID;
