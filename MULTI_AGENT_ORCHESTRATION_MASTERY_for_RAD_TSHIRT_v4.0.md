# Multi‑Agent Orchestration Mastery (RAD_TSHIRT v4.0 Edition)

This is a focused, brand‑neutral synthesis of the context lifecycle from the broader Multi‑Agent Orchestration Mastery guide, tuned for how RAD_TSHIRT v4.0 is used in real projects.

## Why it exists

Large models forget; teams don’t have to. RAD_TSHIRT encodes the guardrails (pre‑commit gates) while the orchestration guide encodes the habits (context capture and handoff). Together they:
- Prevent knowledge loss between sessions and contributors
- Reduce “rediscovery tax” on every switch
- Support parallel, multi‑agent workflows with confidence

## Roles, at a glance

- PM (Conductor): orchestrates and delegates; does not implement
- CODEX (Lead engineer): codes, tests, architects
- COPILOT (Automation): git, CI/CD, scripting
- FRIDAY (Quality): testing, auditing, validation
- META (Process): monitors, evolves, and enforces protocol

Tip: Keep orchestrators and implementers distinct. Delegation is a first‑class task.

## The context lifecycle

1) Capture
- Append‑only logs of decisions and changes
- Single attachments directory per thread
- Standard broadcast channel duplicated into all logs

2) Compress
- Summarize after meaningful units of work
- Keep decisions, constraints, and gotchas
- Prefer structured bullets over prose

3) Hydrate
- Rebuild state from the latest capsule + logs
- Identity first, then tools, then current state
- Verify tool permissions and boundaries

4) Rehydrate (handoff)
- Trigger at 30% remaining context, or on strike policy
- Use a pre‑filled capsule template (identity, work done, WIP, critical context, pending tasks, gotchas, instructions)
- Target 15 minutes to full confidence

## Minimal capsule template

```
# [ROLE] Dehydration Capsule
Date: <UTC timestamp>
Agent: <name or persona>
Context Remaining: <percent + emoji>
Session: <project/sprint>

IDENTITY
- Role: <role>
- Authority: <what you decide>
- Restrictions: <what you never do>

WORK COMPLETED
- <bullet list>

WORK IN PROGRESS
- <bullet list>

CRITICAL CONTEXT
- <decisions, constraints, gotchas>

PENDING TASKS
- <next steps with owners>

HANDOFF NOTES
- <exact instructions to resume>
```

## Enforcement that helps, not hinders

- Start at “M” size: tests enforced, lint advisory
- Graduate to “XL”: tests + lint + coverage enforced
- Tune instantly via `enforcement/pre_commit_gates.json`
- Hooks are project‑relative and portable; installers have git‑root fallback

## Parallelism patterns that work

- Debugging committees (5 agents in parallel) + outside reviewer synthesis
- Research sweep (3+ agents) then codex synthesis and implementation
- PM stays orchestration‑only; META watches strike policy and context thresholds

## What to implement first

- Context reporting in every message
- Dehydration at 30% mandatory
- Tool permissions by role (PM requests exceptions)
- Communication format and broadcast channel

## Success metrics

- Handoff success >95%
- Rehydration <45 minutes to full speed
- Context per task <20%
- Dehydration time <15 minutes

See also:
- `RAD_TSHIRT_v4.0/protocols/HANDOFF.md`
- `RAD_TSHIRT_v4.0/docs/COMMAND_MENU.md`
- `RAD_TSHIRT_v4.0/enforcement/pre_commit_gates.json`
