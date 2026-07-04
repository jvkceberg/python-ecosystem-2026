#!/bin/env bash
set -eu

BASE="$HOME/git-conflict-sim"
TEMP="/tmp/remote-conflict-sim"

rm -rf "$TEMP"

cd "$BASE"

ORIGIN_URL="$(git remote get-url origin)"

git clone "$ORIGIN_URL" "$TEMP"

cd "$TEMP"

git config user.name "jvkceberg"
git config user.email "jtic0524@gmail.com"

echo "README updated by another user" > README.md

git add README.md
git commit -m "update README from another user"
git push origin main

cd /
rm -rf "$TEMP"

echo
echo "Done."
echo "Another user's commit has been pushed to origin/main."
echo
echo "Now try this in ~/git-conflict-sim:"
echo "  echo 'README updated by me' > README.md"
echo "  git add README.md"
echo "  git commit -m 'update README from me'"
echo "  git push"
