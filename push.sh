#!/bin/sh
set -x

files="data.sql.*"
for filepath in ${files}
do
  git add "$filepath"
  git commit -m "update data"
  git push origin HEAD
done

git add -A
git commit -m "update data"
git push origin HEAD
