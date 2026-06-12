#!/usr/bin/env bash
# Lab smoke test, run as the devcontainer postCreateCommand. The workspace
# container only starts after the mssql service reports healthy (compose
# depends_on: service_healthy), so by the time this runs the databases are
# restored — this proves the student path end-to-end: the student login can
# SELECT from SalesLT.Customer. Output lands in the Codespace creation log
# (`gh codespace logs`), making the check verifiable without SSH.
set -uo pipefail

SQLCMD_VERSION=v1.8.2
case "$(uname -m)" in
  x86_64)  SQLCMD_ARCH=amd64 ;;
  aarch64) SQLCMD_ARCH=arm64 ;;
  *) echo "LAB SMOKE TEST: SKIP (unsupported arch $(uname -m))"; exit 0 ;;
esac

curl -fsSL -o /tmp/sqlcmd.tar.bz2 \
  "https://github.com/microsoft/go-sqlcmd/releases/download/${SQLCMD_VERSION}/sqlcmd-linux-${SQLCMD_ARCH}.tar.bz2" \
  && tar -xjf /tmp/sqlcmd.tar.bz2 -C /tmp sqlcmd
if [ ! -x /tmp/sqlcmd ]; then
  echo "LAB SMOKE TEST: FAIL (could not fetch sqlcmd)"; exit 1
fi

ROWS=$(/tmp/sqlcmd -S mssql -U student -P 'Student!Pass123' -d AdventureWorksLT \
  -C -h -1 -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM SalesLT.Customer;" | tr -dc '0-9')

if [ "${ROWS:-0}" -gt 0 ]; then
  echo "LAB SMOKE TEST: PASS (SalesLT.Customer rows: ${ROWS}, login: student)"
else
  echo "LAB SMOKE TEST: FAIL (no rows from SalesLT.Customer)"; exit 1
fi
