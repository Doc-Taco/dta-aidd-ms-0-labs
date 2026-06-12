# Lesson 0A.2 — Keys and Relationships

Starter queries for **[Lesson 0A.2 (script)](https://abbottics-ai.atlassian.net/wiki/spaces/DTA/pages/126189570)**.

- **Database:** AdventureWorksLT (`SalesLT` schema)
- **Query budget:** 5

## What you'll do
- Read a **primary key** (`Customer.CustomerID`) as the unique identifier of a row.
- Read a **foreign key** (`SalesOrderHeader.CustomerID`) as a reference to another table's row.
- Trace a relationship by matching one key value across two tables — by hand, before any `JOIN`.

## Run it
Open [`01-keys-and-relationships.sql`](01-keys-and-relationships.sql), connect with the **AIDD-MS Lab (AdventureWorksLT)** profile, and run each statement with ▶.

> In query 4 and 5, the example uses `CustomerID = 29847`. If that returns no rows, swap in any `CustomerID` that query 3 listed — those are the customers that actually placed orders.
