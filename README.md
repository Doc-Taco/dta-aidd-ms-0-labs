# AIDD-MS-0 — SQL Foundations Lab

The student lab environment for **AIDD-MS-0 (SQL Foundations)**. A ready-to-use
SQL Server 2025 with the **AdventureWorksLT** sample database — no install, no
setup. Open it in the cloud and start querying.

## Start the lab

### Option A — GitHub Codespaces (recommended)

Click **Code → Codespaces → Create codespace**, or **Use this template** to make
your own copy first. VS Code opens in your browser with the **MSSQL extension**
already installed and a connection profile ready.

> Codespaces is the default path for MS-0. It runs on Linux in the cloud, works
> identically on every OS, and is covered by the GitHub personal free tier — no
> local install and nothing to configure.

### Option B — local VS Code + Docker (optional)

Install [VS Code](https://code.visualstudio.com/), the
[Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers),
and Docker Desktop or OrbStack (16 GB RAM recommended). Open this folder and
**Reopen in Container**. On Apple Silicon the database runs under emulation —
Codespaces is smoother.

## Run your first query

1. Wait for the bottom-left status to show the dev container is ready (the
   database finishes restoring on first boot — about 15–30 seconds).
2. Open [`queries/01-hello-adventureworks.sql`](queries/01-hello-adventureworks.sql).
3. Connect using the pre-seeded **AIDD-MS Lab (AdventureWorksLT)** profile (the
   MSSQL extension prompts, or pick it from the SQL Server view in the sidebar).
4. Run with the ▶ button (or `Ctrl/Cmd+Shift+E`). You'll get rows back from
   `SalesLT.Customer` immediately.

## Course labs

The lesson-by-lesson starter queries live in [`labs/`](labs/), one folder per
lesson, each linked back to its lesson script in Confluence. Start with
[`labs/0A.1`](labs/0A.1).

## What's connected

| Setting | Value |
| --- | --- |
| Server | `mssql,1433` |
| Login / password | `student` / `Student!Pass123` |
| Default database | `AdventureWorksLT` (primary) |
| Also available | `AdventureWorks` (full, for advanced lessons) |

These are non-secret lab credentials for a throwaway database — they grant access
only inside this disposable container.

## Reset the lab

Delete the Codespace (or `Dev Containers: Rebuild Container` locally) and launch a
fresh one. The database is restored clean on first boot.

## How this fits together

This repo is intentionally **thin**. The database — SQL Server 2025 plus the
restored sample data — lives in the shared base image
`ghcr.io/doc-taco/dta-aidd-ms-labs-base`, pinned to a version in
[`.devcontainer/docker-compose.yml`](.devcontainer/docker-compose.yml). This repo
adds only the dev-container definition, the connection profile, and the lab
queries.

---

_Proprietary — © Doc Taco. See [LICENSE](LICENSE)._
