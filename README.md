# RAD_TSHIRT v4.0

A portable, brand‑neutral pre‑commit enforcement kit with docs, protocols, and a zero‑friction installer. It helps non‑coders and engineers ship with confidence by encoding quality gates and a repeatable context lifecycle.

- Who it’s for: product leaders, PMs, IC engineers, QA, and anyone who wants “batteries‑included” quality without wiring CI first.
- What you get: pre‑commit gates (tests, lint, coverage), docs you can hand to stakeholders, handoff/rehydration protocols, and a clean folder you can drop into any repo.

## The T‑Shirt Metaphor 👕

RAD_TSHIRT is designed like a great t‑shirt:

- Collar (PM): sets direction and keeps shape — orchestration and delegation only.
- Fabric (CODEX): the body of implementation — coding and architecture.
- Seams (COPILOT): automation that holds it together — git, CI/CD, scripts.
- Tag (FRIDAY): quality you can trust — testing, auditing, validation.
- Care label (META): how to wash and scale it — process stewardship and evolution.

Sizes map to enforcement strength:
- S: advisory checks only (no block) — explore safely.
- M: tests must pass — lint is advisory.
- L: tests + lint must pass — coverage is advisory.
- XL: tests + lint + coverage enforced — production‑ready defaults.

You can tune these via `RAD_TSHIRT_v4.0/enforcement/pre_commit_gates.json`.

## What’s inside

- `RAD_TSHIRT_v4.0/`
  - `enforcement/` — pre‑commit engine, master hook, and declarative gates
  - `scripts/` — portable installer with git‑root fallback
  - `docs/` — product card, command menu, and quick start material
  - `protocols/` — handoff, communication, and cleanup guides

## Quick start

- Requirements: macOS/Linux, Git, Node.js 18+
- Install the hook:
  - cd into the folder: `cd RAD_TSHIRT_v4.0`
  - run installer: `./scripts/install-precommit.sh` (add `--dry-run` to preview)
- Commit as usual: the hook enforces your configured gates before allowing the commit.

Optional manual run: open `enforcement/pre_commit_gates.json` and execute your test/lint commands directly. The hook uses those same commands under the hood.

## Multi‑Agent Orchestration & Context Lifecycle

Multi‑agent work shines when your context is preserved and re‑usable. This repo includes a tailored guide that shows how to capture, compress, hydrate, and hand off context with zero drama:

- See: `MULTI_AGENT_ORCHESTRATION_MASTERY_for_RAD_TSHIRT_v4.0.md`
- Protocols to start with: `RAD_TSHIRT_v4.0/protocols/HANDOFF.md` and `RAD_TSHIRT_v4.0/protocols/COMMUNICATION.md`

## Case studies (short)

- 4% emergency handoff → 15‑minute recovery with 95% continuity by using a pre‑filled capsule format.
- Security edge case found in parallel by a 5‑agent debugging committee → fix landed in 2 hours instead of 2 days.
- Protocol evolution: rehydration streamlined from 7 levels to 4, reducing context overhead by ~50%.

## License

MIT. Attribution appreciated but not required.
