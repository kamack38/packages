#!/usr/bin/env bash
set -euo pipefail

EXCLUDE="${1:-${EXCLUDE:-}}"

if [ -n "$EXCLUDE" ]; then
	EXCLUDE_PATTERN="^($(echo "$EXCLUDE" | tr ' ' '|'))$"
else
	EXCLUDE_PATTERN="^$"
fi

PACKAGES=$(find ./packages/ -type f -name '*PKGBUILD' |
	sed -r 's|/[^/]+$||' |
	sort | uniq |
	cut -f3 -d'/' |
	grep -Ev "$EXCLUDE_PATTERN" |
	jq -R . | jq -cs .)

# Output for GitHub Actions
if [ -n "${GITHUB_OUTPUT:-}" ]; then
	echo "packages=$PACKAGES" >>"$GITHUB_OUTPUT"
fi

echo "Generated matrix: $PACKAGES"
