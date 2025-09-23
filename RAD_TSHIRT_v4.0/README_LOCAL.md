(Quick start — copy/paste these three lines into a Terminal)

```bash
# 1) install dependencies (auto-detects pnpm / yarn / npm)
./scripts/pm.sh install

# 2) run tests to verify everything is working
./scripts/pm.sh test

# 3) (optional) run pre-commit installer dry run to see what would change
sh scripts/install-precommit.sh --dry-run
```

Notes:
- If you prefer to avoid package managers, you can skip step 1, but tests and some scripts may not run.
- If the installer blocks on coverage, run `./scripts/pm.sh coverage` to see the report and then decide (fix/accept/change gate).

