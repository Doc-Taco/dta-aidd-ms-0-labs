# Lab Environment Validation (DTA-8)

Validation record for the default **GitHub Codespaces** path. Local Docker
Desktop is descoped from validation — it remains documented in the README as a
best-effort optional path, but Codespaces is the supported way to run the lab
for MS-0 → MS-2.

## Why one validation covers every student OS

A Codespace runs on GitHub's **x86-64 Linux cloud hosts** regardless of the
student's machine — Windows, macOS (Intel or Apple Silicon), Linux, or a
Chromebook. The student's device only runs a browser (or the VS Code desktop
client connected remotely). There is no per-OS environment to validate: the
container, the SQL Server, and the data are identical for everyone. This is
also why Apple Silicon needs no special handling on this path — no emulation
is involved anywhere.

## What was validated (2026-06-12)

A real Codespace was created from this repo on a **personal account** (the
student billing path, free tier) on the 2-core machine type, and verified over
`gh codespace ssh`:

| Check | Result |
| --- | --- |
| Workspace container | x86-64, Ubuntu 24.04 — no emulation |
| `mssql` service | resolves on the compose network, port 1433 open |
| MSSQL extension | `ms-mssql.mssql` v1.43 installed at creation (with its dependency pack) |
| Connection profile | "AIDD-MS Lab (AdventureWorksLT)" pre-seeded in machine settings |
| Student query | `SELECT COUNT(*) FROM SalesLT.Customer` → **847 rows** as `student` |
| Sample databases | `AdventureWorksLT` and `AdventureWorks` both present |
| Cold-start time | ~2–2.5 min to Available (no prebuilds), DB restored and queryable |

## The standing self-check

Every Codespace created from this repo runs
[`.devcontainer/smoke-test.sh`](../.devcontainer/smoke-test.sh) as its
`postCreateCommand`: it executes the student `SELECT` and writes
`LAB SMOKE TEST: PASS (SalesLT.Customer rows: N, login: student)` into the
creation log. To check any codespace, run:

```bash
gh codespace logs -c <codespace-name> | grep "LAB SMOKE TEST"
```

The push-time CI (`validate-lab`) additionally brings up the same compose
stack on an amd64 runner and executes every starter query in `labs/` as the
student login.

## Client-side notes

- **Browser vs. desktop VS Code:** both work; the browser needs zero install
  and is the default teaching path. Desktop VS Code connects via the
  Codespaces extension if a student prefers it.
- **Free tier:** personal accounts include 120 core-hours/month (~60 hours on
  the 2-core machine). Stop or delete idle codespaces at
  [github.com/codespaces](https://github.com/codespaces); this repo's
  codespaces default to a 30-minute idle timeout.
- **Reset:** deleting the codespace and creating a fresh one restores a clean
  database (the restore runs on first boot).

## Operator notes (not student-facing)

- `gh codespace ssh` requires the `sshd` devcontainer feature (present in
  [`devcontainer.json`](../.devcontainer/devcontainer.json)) and the
  `codespace` token scope (`gh auth refresh -s codespace`).
- If SSH fails with `Permission denied (publickey)`, delete the stale
  auto-generated keypair (`rm ~/.ssh/codespaces.auto*`) and reconnect — `gh`
  regenerates and re-registers it. A keypair left behind by a failed earlier
  connection causes exactly this symptom.
