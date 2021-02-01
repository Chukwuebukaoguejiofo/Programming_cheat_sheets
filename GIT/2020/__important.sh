# remove last 2 commits locally
git reset --hard HEAD~2

# undoes the changes from commit abc123, creating a new commit with the changes
git revert abc123


# Undo commit
git reset --soft HEAD~1

# undo git add
git reset foo.txt
