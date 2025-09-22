# RAD v3.0 TSHIRT — CLEANUP

Purpose: fast, deterministic hygiene before commit/merge. Optimized for pre-commit hooks and CI.

## Primary rules (enforced or checked by gates)
- Console/debug:
	- Remove all `console.log` and `debugger` statements (tests may log).
- Dead/duplicate code:
	- Delete obviously unreachable code. If non-trivial, add TODO with issue id and skip commit.
	- Consolidate 3+ duplicate blocks into a shared helper.
- Imports & order:
	- Built-ins → external → internal-absolute → relative (shallow→deep). Remove unused imports.
- Naming:
	- Variables/functions: camelCase. Classes/Components: PascalCase. Constants: UPPER_SNAKE.
	- Files: kebab-case; allow `index.js` only for package surfaces.
- File size & complexity (guides):
	- Aim ≤200 lines/file; consider split >300 lines or cyclomatic complexity >10.
- Secrets:
	- Never commit API keys, tokens, passwords, private keys. Use env and .gitignore.
- Docs:
	- If behavior or UX changes, update README and relevant protocol docs.

## Minimal checklist (pre-commit)
1) Tests green: `npm test`
2) Lint clean (or fixed): `npm run lint` (optionally `npm run lint:fix`)
3) Coverage meets threshold: `npm run test:coverage`
4) No logs/debuggers; imports pruned; names sane; secrets absent
5) Docs updated if needed

## Gate mapping (BMAD-aligned)
- tests_pass → `npm test`
- lint_clean → `npm run lint`
- coverage_threshold → `npm run test:coverage`

## Notes for operators
- Prefer small, frequent cleanups; don’t batch risky refactors late in a PR.
- If a cleanup is large, create a focused PR labeled `refactor(cleanup)`.
- Use handoff if context ≥30% and cleanup spans multiple files/modules.

## Inspirations
- v2.0 CLEANUP_PROTOCOL pragmatics (dead code, duplication, structure, naming)
- v3.0 Voltron ethos (progressive assistance) distilled to actionable rules
