# Multi‑Agent Orchestration (RAD_TSHIRT v4.0 Edition)

Punchy guide to context lifecycle + role clarity.

Slide index
- Why → #why
- Roles → #roles-t-shirt-stays-on-roles-dont-change
- Visuals → #visuals
- Lifecycle → #lifecycle-capture--compress--hydrate--rehydrate
- Capsule → #minimal-capsule-template
- Enforcement → #enforcement-that-helps-sizes
- Patterns → #patterns-that-work
- Do these first → #do-these-first
- Metrics → #success-metrics

## Why

- Models forget; teams shouldn’t
- RAD_TSHIRT = guardrails; this guide = habits
- Outcomes: less rediscovery, more parallelism

## Roles (wardrobe of t‑shirts)

- PM shirt (Conductor): orchestrate/delegate only
- LEAD shirt (Lead engineer): code/test/architect
- DEV shirt (Implementation): git/CI/CD/scripts
- QA shirt (Quality): test/audit/validate
- OPS shirt (Operations): monitor/evolve/enforce

Wardrobe

```
[ PM ]  [ LEAD ]  [ DEV ]  [ QA ]  [ OPS ]
	👕        👕           👕           👕         👕
```

Rule: switching shirts = switching permissions; never mix shirts.

## Visuals

Orchestration vs One Agent

```
TRADITIONAL:                    ORCHESTRATED:
┌──────────────┐               ┌─────────────┐
│              │               │      PM     │ ← Conductor
│  One Agent   │               ├──────┬──────┤
│  Does All    │      VS       │ LEAD │  DEV  │ ← Musicians
│              │               ├──────┼──────┤
│              │               │  QA  │  OPS │ ← Support
└──────────────┘               └──────┴──────┘
```

Why it works
- Division of labor: section players (LEAD/DEV/QA/Ops) specialize and move in parallel
- Shared score: specs, tests, and gates keep everyone on the same page
- Timing & dynamics: PM conducts, sets tempo, and handles transitions
- Continuous tuning: QA/Ops listen for drift, enforce thresholds, and keep the ensemble tight

Context as a Finite Budget

```
💰 Context Budget Accounting
┌─────────────────────────────────────────┐
│ Total Budget: 100%                     │
│ ├── Orchestration: 15–20%             │
│ ├── Implementation: 60–70%            │
│ ├── Quality/Testing: 10–15%           │
│ └── Reserve/Buffer: 5–10%             │
└─────────────────────────────────────────┘
```

Delegation Pyramid

```
			┌───────┐
			│  PM   │ ← Makes decisions
		  ╱│       │╲
		 ╱ └───────┘ ╲
		╱             ╲
	┌─────┐       ┌───────┐
		│ LEAD│       │  DEV  │ ← Execute work
	└─────┘       └───────┘
  ╱   │   ╲     ╱   │    ╲
 ╱    │    ╲   ╱    │     ╲
[Specialists]  [Specialists] ← Deep expertise
```

## Lifecycle (capture → compress → hydrate → rehydrate)

1) Capture
- Append‑only logs; single attachments dir; broadcast duplicated into all logs

2) Compress
- Summarize per unit; keep decisions/constraints/gotchas; favor bullets

3) Hydrate
- Rebuild from capsule+logs; identity → tools → current state; verify permissions

4) Rehydrate (handoff)
- Trigger at 30% (or strike policy); use capsule; target 15 minutes

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

## Enforcement that helps (sizes)

- Start “M”: tests block; lint advisory
- Grow “XL”: tests+lint+coverage block
- Tune in `enforcement/pre_commit_gates.json`
- Hooks portable; installer has git‑root fallback

## Patterns that work

- Debug committees (5) + outside‑reviewer synthesis
- Research sweep (3+) → CODEX synthesis → implement
- PM orchestrates; META watches thresholds/strikes

## Do these first

- Context reporting each message
- Dehydrate at 30%
- Tool permissions by role
- Broadcast channel + shared format

## Success metrics

- Handoff >95%
- Rehydrate <45 min
- Context per task <20%
- Dehydrate <15 min

See also → `RAD_TSHIRT_v4.0/protocols/HANDOFF.md`, `RAD_TSHIRT_v4.0/docs/COMMAND_MENU.md`, `RAD_TSHIRT_v4.0/enforcement/pre_commit_gates.json`
