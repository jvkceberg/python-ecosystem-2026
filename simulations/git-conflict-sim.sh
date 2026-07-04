#!/bin/env bash
set -eu

BASE="$HOME/git-conflict-sim"

if [ -e "$BASE" ]; then
  echo "Error: $BASE already exists."
  echo "Please remove it manually if you want to recreate the exercise."
  exit 1
fi

mkdir -p "$BASE"
cd "$BASE"

git init

touch main.py
git add main.py
git commit -m "first commit"

mkdir src
touch src/test.py
touch pyproject.toml
git add src/test.py pyproject.toml
git commit -m "simple project"

git branch dev/feature

echo "README from main" > README.md
git add README.md
git commit -m "add README"

git switch dev/feature

echo "README from dev/feature" > README.md
git add README.md
git commit -m "add README"

git switch main

echo
echo "Done."
echo "Repository created at: $BASE"
echo
echo "Try:"
echo "  git merge dev/feature"
