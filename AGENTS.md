# AGENTS (assistant guidance)

This file documents expectations and guardrails for automated agents (Copilot, CI bots, assistants).

Rules for agents
- Always run `flutter analyze` and `flutter test` locally before opening a PR.
- Do not commit secrets or environment variables. Use `ENV.example` for templates.
- Keep changes small and scoped to a single feature or fix.
- Add unit tests for business logic and provider code.

Permissions
- Agents may create or update scaffolding, tests, and documentation.
- Agents must not modify `DEV_SETUP.md` or `ARCHITECTURE.md` without human review.

Helpful commands
- `flutter pub get`
- `flutter analyze`
- `flutter test`
