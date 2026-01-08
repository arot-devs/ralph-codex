---
name: ralph-codex
description: "Operate the Ralph autonomous agent loop in this repo. Use when asked to run/continue Ralph, check Ralph status, manage prd.json/progress.txt/archive, or work with ralph.sh/prompt.md/flowchart. Triggers: run ralph, continue ralph, ralph status, execute ralph iteration, ralph flowchart."
---

# Ralph Codex Operator

## Overview

Run and supervise Ralph (the Codex loop) and maintain its project files (`prd.json`, `progress.txt`, `archive/`, `prompt.md`, `AGENTS.md`).

## Workflow

1. Read `prd.json` and `progress.txt` to understand current status.
2. If `prd.json` does not exist and the user provided a PRD, switch to the `ralph` skill to convert it.
3. If the user wants to run the loop, execute `./ralph.sh [max_iterations]` from repo root.
4. Report whether Ralph completed (`<promise>COMPLETE</promise>` appears) or hit the max iterations, and summarize progress.
5. If asked to view or demo the flowchart, use `cd flowchart && npm run dev` (or `npm run build` for a static build).
6. When you discover reusable patterns, update the closest relevant `AGENTS.md` and/or the `## Codebase Patterns` section in `progress.txt`.

## Guardrails

- Do not modify `prompt.md` or `ralph.sh` unless the user explicitly asks.
- `progress.txt` is append-only; keep `## Codebase Patterns` at the top.
- `ralph.sh` auto-archives when `branchName` changes; if you update `prd.json` manually without running `ralph.sh`, archive first.
- Ralph works one story per iteration; do not combine stories.

## Common Requests

- "Run Ralph for N iterations" -> run `./ralph.sh N`.
- "Check Ralph status" -> summarize `prd.json` (passes) and latest `progress.txt` entry.
- "Show the Ralph flowchart" -> run flowchart dev server or build.
