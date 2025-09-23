# CHANGELOG

## 2025-09-22 - Sync portability fixes

- Added fallback search paths for `scripts/install-precommit.sh` so the installer works when the template is copied into different repo layouts.
- Standardized sandbox environment variable to `AGENT_SANDBOX_DIR` (no legacy fallbacks retained in the spinout).
- Clarified coverage behavior in README (coverage is executed and reported; can be configured to block commits).
