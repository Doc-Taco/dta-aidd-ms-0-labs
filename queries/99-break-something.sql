/* =====================================================================
   AIDD-ORIENT · Lesson O-A.6 — Reset is rebuild (Segment 4)

   This file exists to be undone. It harmlessly "breaks" the sample data so
   you can watch a rebuild put everything back:

     1. Run queries/01-hello-adventureworks.sql — note row 1's first name.
     2. Run the UPDATE below, then re-run the hello query — the name changed.
     3. Rebuild (command palette: "Codespaces: Rebuild Container", or delete
        the codespace and create a fresh one).
     4. Re-run the hello query — pristine again.

   The database restores clean on every first boot, so a fresh container is
   a fresh lab. Break things on purpose — the lab is disposable by design.
   ===================================================================== */

UPDATE SalesLT.Customer SET FirstName = 'BROKEN' WHERE CustomerID = 1;
