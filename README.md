# RAD_TSHIRT v4.0 — presentation quick tour

Portable, brand‑neutral pre‑commit gates + docs + protocols. Drop the folder in, ship with confidence.

Who it’s for → PMs, ICs, QA, and product leads who want batteries‑included quality without wiring CI first.
What you get → tests/lint/coverage gates, handoff/rehydration protocols, and a zero‑friction installer.

---

## 👕 The T‑Shirt Metaphor

RAD_TSHIRT fits to your team like a great tee:

- Collar (PM) → direction + shape | orchestration only
- Fabric (CODEX) → implementation | code + tests + architecture
- Seams (COPILOT) → automation | git, CI/CD, scripts
- Tag (FRIDAY) → quality mark | testing, auditing, validation
- Care label (META) → how to scale | process stewardship

Sizes → enforcement strength (tune in `enforcement/pre_commit_gates.json`):
- S: advisory only | M: tests block | L: tests+lint block | XL: tests+lint+coverage block

---

## 🔭 Orchestration vs One Agent

```
TRADITIONAL:                    ORCHESTRATED:
┌──────────────┐               ┌─────────────┐
│              │               │      PM     │ ← Conductor
│  One Agent   │               ├──────┬──────┤
│  Does All    │      VS       │ CODEX│COPILOT│ ← Musicians
│              │               ├──────┼──────┤
│              │               │FRIDAY│ META │ ← Support
└──────────────┘               └──────┴──────┘
```

Why it wins → parallelism, checks‑and‑balances, faster synthesis, lower rediscovery tax.

---

## 💰 Context is a Finite Budget

```
┌─────────────────────────────────────────┐
│ Total Budget: 100%                     │
│ ├── Orchestration: 15–20%             │
│ ├── Implementation: 60–70%            │
│ ├── Quality/Testing: 10–15%           │
│ └── Reserve/Buffer: 5–10%             │
└─────────────────────────────────────────┘
```

Spend wisely → preserve, compress, re‑use.

---

## 🧭 Delegation Pyramid

```
         ┌───────┐
         │  PM   │ ← Makes decisions
        ╱│       │╲
       ╱ └───────┘ ╲
      ╱             ╲
   ┌─────┐       ┌───────┐
   │CODEX│       │COPILOT│ ← Execute work
   └─────┘       └───────┘
  ╱   │   ╲     ╱   │    ╲
 ╱    │    ╲   ╱    │     ╲
[Specialists]  [Specialists] ← Deep expertise
```

PM delegates; implementers implement; specialists go deep.

---

## 🔄 Context Journey (handoff triggers)

```
100% ────→ 70% ────→ 50% ────→ 30% ────→ 0%
 🟢        🟡        🟠        🔴       ⚫
Normal   Delegate  Prepare  DEHYDRATE  Dead
         Heavily   Handoff   MANDATORY
```

Dehydrate at 30% → zero knowledge loss, 15‑min rehydration target.

---

## 📦 What’s inside (one folder)

- `RAD_TSHIRT_v4.0/`
  - `enforcement/` → engine, master hook, declarative gates
  - `scripts/` → portable installer (git‑root fallback)
  - `docs/` → product card, command menu, quick start
  - `protocols/` → handoff, communication, cleanup

---

## 🚀 Quick start

- Requirements → macOS/Linux, Git, Node 18+
- Install → `cd RAD_TSHIRT_v4.0 && ./scripts/install-precommit.sh` (add `--dry-run` to preview)
- Commit normally → your configured gates run before commit

Manual run → edit `enforcement/pre_commit_gates.json`; run the same scripts directly.

---

## 🧠 Multi‑Agent & Lifecycle

Use the visual guide:
- `MULTI_AGENT_ORCHESTRATION_MASTERY_for_RAD_TSHIRT_v4.0.md`
- `RAD_TSHIRT_v4.0/protocols/HANDOFF.md`
- `RAD_TSHIRT_v4.0/protocols/COMMUNICATION.md`

---

## ✅ Tiny case studies

- 4% emergency handoff → 15‑minute recovery, ~95% continuity
- 5‑agent debug committee → 2‑hour fix vs 2 days solo
- Rehydration protocol v2 → ~50% lower context overhead

---

## 📄 License

MIT
