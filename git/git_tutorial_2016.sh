# git tutorial:

# https://www.atlassian.com/git/tutorials/
#-----------------------------------------------------------------------------------

HEAD - is a pointer to your last commit.

#-----------------------------------------------------------------------------------

# git work flow:  adding a file, changing the file, adding it again, committing the file

$ git add <file> # adds the file to staging area

$ git reset <file> # unstages a file
# reverse of $ git add <file>
# same as `$ git reset -- HEAD <file> `

$ git reset --soft <file> # THIS COMMAND DOES NOT EXIST

$ git checkout -- <file> # restores the file as it was in the last commit, and removes the file from the staging area
# same as `$ git checkout HEAD -- <file>`

$ git commit -m 'my message' # commit the stagging area

$ git add . # add all files to staging area

$ git reset --soft # this file does not exist  # same as `git reset --soft HEAD` ???
$ git reset --soft HEAD~1 # reverse of `git commit`, it will put files back to the stagging area  # dont do this after you push

# git reset is dangerous !!!
$ git reset # unstages all files
# reverse of `$ git add .`
# same as `$ git reset --mixed`

# git reset is dangerous !!!
$ git reset --hard HEAD  # same as `$ git reset --hard`
# restores all files as they were in the last commit, and removes all the files from the staging area
# this command is usually followed by a `$ git clean -f`
# Remember that resetting only affects tracked files,
# so a separate command is required for cleaning up untracked ones.
# Combined, these two commands let you return the working directory
# to the exact state of a particular commit.
# - NEW files are NOT affected by git reset --hard

# The git reset --hard and git clean -f commands are your best friends after you’ve
# made some embarrassing developments in your local repository and want to burn
# the evidence. Running both of them will make your working directory match
# the most recent commit, giving you a clean slate to work with.


# git reset is dangerous !!!
$ git reset --hard HEAD~1  
# (moves HEAD back once, so if you have 5 commits, it will point to commit number 4)
# undo LAST COMMIT AND ALL CHANGES,
# - if you really screwed and want to start again fresh
# dont do this after you push !!!
# - this command is usually followed by a `$ git clean -f`
# Remember that resetting only affects tracked files,
# so a separate command is required for cleaning up untracked ones.
# Combined, these two commands let you return the working directory
# to the exact state of a particular commit.
# - NEW files are NOT affected by git reset --hard


# git reset is dangerous !!!
$ git reset --hard HEAD~2 
# (moves HEAD back twice, so if you have 5 commits, it will point to commit number 3)
# undo last 2 commits # dont do this after you push
# - this command is usually followed by a `$ git clean -f`
# Remember that resetting only affects tracked files,
# so a separate command is required for cleaning up untracked ones.
# Combined, these two commands let you return the working directory
# to the exact state of a particular commit.
# - NEW files are NOT affected by git reset --hard

#----------------------------------------------------------------------------------- saving changes
$ git add <file> # adds the file to staging area

$ git add . # add all files to staging area

$ git commit -m 'my message' # commit the stagging area

$ git commit -a   # save all changes in tracked files of the working directory

$ git status # list which files are staged, unstaged, and untracked.

#----------------------------------------------------------------------------------- viewing old commits
$ git checkout master # a way to get back to the "current" state of the project.

$ git checkout <commit> <file>
# - Check out a previous version of a file.
#   This turns the <file> that resides in the working directory into an
#   exact copy of the one from <commit>
#   and adds it (the file version from the commit) to the staging area.
#   this does affect the current state of your project.
#   This previous file version from the <commit> of the file will
#   show up as a "Change to be committed"
# - You can re-commit the old version in a new snapshot as you would any
#   other file.
# - to undo this (to get back to the "current" state of your file), use: `$ git checkout HEAD <file>`

$ git checkout <commit>
# This makes your working directory match the exact state of the <commit>.
# You can use either a commit hash or a tag as the <commit> argument.
# You can look at files, compile the project, run tests, and even edit files
# without worrying about losing the current state of the project. Nothing you
# do in here will be saved in your repository. To continue developing, you need
# This will put you in a detached HEAD state.
# - to undo this (to get back to the "current" state of your project), use: `$ git checkout master`
# - Checking out an old commit is a read-only operation. It’s impossible to harm your
#   repository while viewing an old revision. The "current" state of your project remains
#   untouched in the master branch

#----------------------------------------------------------------------------------- undoing changes

$ git revert <commit>
# Generate a new commit that undoes all of the changes introduced in <commit>,
# then apply it to the current branch.

# The git revert command undoes a committed snapshot.
# But, instead of removing the commit from the project history,
# it figures out how to undo the changes introduced
# by the commit and appends a new commit with the resulting content.
# This prevents Git from losing history,
# which is important for the integrity of your revision history
# and for reliable collaboration.

# Reverting vs. Resetting
# It's important to understand that git revert undoes a single
# commit—it does not "revert" back to the previous state of a
# project by removing all subsequent commits. In Git, this is
# actually called a reset, not a revert.

#----------------------------------------------------------------------------------- diff

$ git diff # Shows what you changed, but haven't staged
$ git diff --cached # Shows what has been staged, but not committed

#----------------------------------------------------------------------------------- remove files

$ git remove <file>
# also $ git rm <file> ???

#----------------------------------------------------------------------------------- log

$ git log # Shows all of the previous commit messages in reverse order

$ git log --pretty=oneline # Shows commits on one line

$ git log --pretty=format:"%h : %an : %ar : %s"
# %h - Abbreviated Hash
# %an - Authors Name
# %ar - Date Changed
# %s - First Line of Comment

$ git log -p -2 # Shows the last 2 commit changes

$ git log --stat # Prints abbreviated stats

$ git log --since=1.weeks # Show only changes in the last week

$ git log --since="2014-04-12" # Show changes since this date

$ git log --author="Brian Spinos" # Changes made by author

$ git log --before="2014-04-13" # Changes made before this date

#----------------------------------------------------------------------------------- cleaning

$ git clean -n # Perform a "dry run" of git clean.
# This will show you which files are going to be removed without actually doing it.

$ git clean -f # Remove UNTRACKED files from the current directory
# CAREFUL, THIS IS NOT UNDOABLE!!!

#----------------------------------------------------------------------------------- branching
# new files are not affeted
# stagging changes are not affected when you change the branch

$ git branch  # list all branches
$ git checkout -b foo # create a new branch based on the current branch
$ git merge foo  # merge the foo branch in to the current branch

#----------------------------------------------------------------------------------- stashing

# gotcha:  you need to add new files to the staging area (or else, GIT will not track them, an they will be lost)
#           - changes to a file that was already added do not need to be added, GIT is smart enough to keep track of those changes, so dont worry!
#           - GIT stash will keep track of the changes in the working directory and also in the staging area!
$ git stash
# now go to the other branch an fix your bug... then get back to your original branch and get back to normal life!
$ git stash pop  # it will pop the changes from the stash stack and apply it to your working directory and staging area



