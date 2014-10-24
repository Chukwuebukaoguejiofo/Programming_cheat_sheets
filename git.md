### Git Consepts Simplified!

[Git Consepts Simplified link](http://gitolite.com/gcs.html#(1)

-------------------------------------------

### Comon Git commands I should know::

`$ git add <file or directory>` add file to the staging area (index)

`$ git reset <file or dir>` reverse of git add

`$ git checkout -- <file or dir>` retrieve how it was in HEAD,  overwriting your changes, if the file is on the staging area (index), you should `git reset <file or dir>`








------------------------------------------

### unstage a file, and keep unstaged changes  <<<<<<<<<<<<<<

`$ git reset HEAD <file>`


-------------------------------------------

### overwrite local branch to look like remote branch

`$ git branch -D foobar`

`$ git checkout --track origin/foobar`

-------------------------------------------

### git logs

`$ git pull origin`

`$ git checkout <branch-name>` # you need to take away the "origin/" part, GIT will know what to do!

-------------------------------------------

[NOTES INDEX](file:///Users/brianspinos777/Desktop/MD/brian_notes.md)


# I need to continue watching:

[GIT REAL > about rebase conflicts @ 2:30](http://gitreal.codeschool.com/levels/6)


[GIT REAL > diffs @ 2:45](http://gitreal.codeschool.com/levels/7)

-------------------------------------------

[Good stuff > things-every-git-beginner-should-do](http://blog.assimov.net/blog/2010/05/19/5-things-every-git-beginner-should-do/) <----> gooood!!

[awesome reference for commands](http://gitref.org/)

[awesome chart](http://ndpsoftware.com/git-cheatsheet.html)

[commands-Cheatsheet](https://github.com/sadiqmmm/cheatsheets/wiki/Ruby-on-Rails-3.2-commands-Cheatsheet)

# AWESOME TIPS:

> WHEN YOU PULL, CLOSE YOUR EDITOR, AND RUN `$ git status` and `$ git diff` and `$ rake db:migrate` (to regenerate bd/schema.rb)

> DONT CHANGE HISTORY

> TAGS ARE A REFERENCE TO A COMMIT

> IF YOUR PUSH IS REJECTED, JUST PULL AND PUSH! 

> CREATE A BRANCH AND WORK ON IT, THEM MERGE

> A BRANCH IS A DIFFERENT TIMELINE! YOU CAN DO WHAT EVER YOU WANT! (BUT THE DATABASES ARE THE SAME FOR ALL.......)

> HEAD IS ON TOP OF ALL THE COMMITS

```
HEAD
.
.
last_commit
.
.
commit3
.
.
commit2
.
.
initial_commit
```


# SOME GOTCHAS:

> `$ git fetch` is the same as `$ git merge origin/master` will bring changes from the remote to our "local" origin/master branch


----------------------------------------

### Stashes

> This is the workflow:
>
> `$ git stash save -u "my message here"` to include the untracked files also
> go to another branch and work on it
> come back to the original branch, and:

> `$ git stash pop` applies the changes and deletes the stash from the list, its ok!
> continue working


# needs more work here right brian ???

> `$ git stash` takes any options that `$ git log` takes

`$ git stash list -p`

`$ git stash list --stat`

`$ git stash show stash@{1}`

`$ git stash show stash@{1} --stat`

`$ git stash show stash@{1} -p`

> `$ git stash save "thi is my message here"` save with message

> the output could be:

> stash@{0}: On my_branch: this is my message here

`$ git stash pop` apply the last stash to your working directory and delete it from the stash list



`$ git stash -u` This will stash everything, including unstaged files ???

`$ git stash pop stash@{1}` ???

`$ git stash drop` ???


----------------------------------------

### Git color:

`$ git config --global color.ui true`


----------------------------------------


### git logs

`$ git log`

`$ git log -n 3 `       (the 3 is the number of commits you want to see)

`$ git log --pretty=format:"%ad > %an > %s > %h > %d"`

`$ git log --pretty=oneline`

`$ git log --oneline`

`$ git log --oneline -p` shows the diffs for the files

`$ git log --oneline --stat` shows insertions and deletions for each file in each commit !!!

`$ git log --oneline --graph` visual representation of the branch merging

`$ git log --until=1.minute.ago`

`$ git log --since=1.day.ago`

`$ git log --since=1.hour.ago`

`$ git log --since=2012-06-15`

`$ git log --until=2012-06-15`

`$ git log --since=1.month.ago --until=2.weeks.ago`

`$ git log --since=2014-01-01 --until=2014-03-10`

`$ git log --author="kevin"`

`$ git log --grep="Init"`         (search for something with "Init" text in it...)

> like git log, but less information:
`$ git log --summary`

> `$ git help log` for more options






--------------------------------------------------------------------------------------------------------------
### REBASE


```
 git rebase <upstream> -> Reverts all commits since the current branch diverged from <upstream>, and then re-applies them one-by-one on top of changes from the HEAD of <upstream>.

```




> instead of `$ git pull` and `$ git push` do a this:

`$ git fetch` it pulls but doesnt merge

`$ git rebase`

> "git rebase" does 3 things:

1. move all changes to master which are not in origin/master to a temporary area "like in limbo" lol...
2. run all origin/master commits (into the place that "master" was, since "master" is now on LIMBO)
3. run all commits in the temporary area (the "limbo" area)

> it basicaly pulls in commits from the the upstream branch and then, adds your local commits



> there are no "merge commits" here !!!


--------------------------------------------------------------------------------------------------------------
### LOCAL BRANCH REBASE (rebase two local branches)

> I believe you need your branches to be clean...

`$ git checkout my_branch_2`

`$ git rebase master` in the my_branch_2 branch, it puts the commits of master under the commits of my_branch_2 (git gives it a new base... lol)


> now the next step it to go to the master branch:

`$ git checkout master`

`$ git merge my_branch_2` it will do a "fastforward thing! its ok"

--------------------------------------------------------------------------------------------------------------
### pluck back file from stagging

`$ git reset HEAD <file>`

--------------------------------------------------------------------------------------------------------------
### show all remote branches

> and tell you if they are tracked or not
> and lots of cool stuff

> stale > means that someboby deleted it

`$ git remote show origin`

> if you want to delete the stale branches do:

`$ git remote prune origin`

--------------------------------------------------------------------------------------------------------------
### removing a remote branch

> only deletes the remote branch, not the local !!!

`$ git push origin :the_branch_i_want_to_delete`

> I you want you can delete the local branch

`$ git branch -d :the_branch_i_want_to_delete`


--------------------------------------------------------------------------------------------------------------
### add a remote

`$ git remote add <name> <address>`


--------------------------------------------------------------------------------------------------------------
### create a remote branch
> it will track it !!!

`$ git checkout -b foobar`

`$ git push origin foobar`

...do some changes...

`$ git push` it will know to push to "origin foobar"

--------------------------------------------------------------------------------------------------------------
### get a remote branch that exists

`$ git pull`

`$ git branch -r` to list all remote branches

> you dont need to put "origin/"

`$ git checkout <the-name_of_the_remote_branch>` it automaticaly tracks the remote branch

...do some changes...

`$ git push` it will know to push to "origin the-name_of_the_remote_branch"


--------------------------------------------------------------------------------------------------------------
### remove a remote

`$ git remote rm <name>`

--------------------------------------------------------------------------------------------------------------
### push to remote and track it
> -u means upstream ?
> -u so you dont need to specify the name of the branch

`$ git push -u origin master`

--------------------------------------------------------------------------------------------------------------
### show the remotes that my local knows about

`$ git remote -v`


--------------------------------------------------------------------------------------------------------------
### blow away the last commit

`$ git reset --hard HEAD^` # DONT DO THIS AFTER YOU PUSH...

### blow away the last 2 commitsssssss

`$ git reset --hard HEAD^^` # DONT DO THIS AFTER YOU PUSH...



--------------------------------------------------------------------------------------------------------------
### Adding to a commit, and overwrite commit message

# DONT DO THIS AFTER YOU PUSH...

`$ git add <file>`

`$ git commit --amend -m "my message here"`


--------------------------------------------------------------------------------------------------------------

# For accidental commits:

### undo last commit, and move everything back to staging
> HEAD^ means to move to the commit 1 before HEAD

# DONT DO THIS AFTER YOU PUSH...

`$ git reset --soft HEAD^`


--------------------------------------------------------------------------------------------------------------
### add tracked files to stage and commit them.
> does not enclude the new, untracked files...

`$ git commit -a -m "my message here"`

--------------------------------------------------------------------------------------------------------------
### remove all changes to a file, get it as it was in the last commit

`$ git checkout -> <file>`

--------------------------------------------------------------------------------------------------------------
### show the diff in staged files

`$ git diff --staged`

--------------------------------------------------------------------------------------------------------------
### show the diff in file between branches (you will see what HEAD did, red is removed and green is inserted)


`git diff origin/master HEAD -- spec/spec_helper.rb`
`git diff origin/master..HEAD -- spec/spec_helper.rb`

> same thing


--------------------------------------------------------------------------------------------------------------
### prevent push to origin master:

`$ git remote set-url --push origin no_push`

--------------------------------------------------------------------------------------------------------------

### push a local branch to remote and track it

`$ git push -u origin my_local_branch_name`


----------------------------------------------------------------------------------------------------------------
### rename a local branch

`$ git branch -m my_new_name`

----------------------------------------------------------------------------------------------------------------

### show the files modified

`$ git diff --name-only`

--------------------------------------------------------------------------------------------------------------
### track remote branch

 The following command will create a local branch named foo, tracking the remote branch origin/foo.
 When you push your changes the remote branch will be updated.

`$ git checkout --track origin/foo`

--------------------------------------------------------------------------------------------------------------

AWESOME: `$ git diff | subl` :   take a look at the differences in sublime.

*I think its not working because I changed the bash_profile.... :(

--------------------------------------------------------------------------------------------------------------
### show the previous commit

`$ git show head~1`

show last commit (or current commit ???)

`$ git show head~0`

show the second previous commit

`$ git show head~2`

*another syntax is:
`$ git show head@{2}`

--------------------------------------------------------------------------------------------------------------
if you do a "git push" and its rejected, ( if someone else pushed before you ) you need to do a "git pull"

--------------------------------------------------------------------------------------------------------------

staged files are files we have told git that are ready to be committed.

checkout: means to checkout, to look at it!

HEAD: By default HEAD points to your last commit,

--------------------------------------------------------------------------------------------------------------
Get a writable copy of any repository by clicking the "fork" button on GitHub

--------------------------------------------------------------------------------------------------------------
use git in the browser:

`$ git instaweb --httpd=webrick`

to stop it:

`$ git instaweb --httpd=webrick --stop`

------------------------------------------------------------------------------------------------------------->
#start git in a folder
```
$ cd (to your folder)
$ git init
$ git add .              # (you can substitute the "."  for a file name.... if you want to be specific)
$ git commit -m "your comments here"
```

--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
about three tree structure:
http://www.lynda.com/home/Player.aspx?lpk4=111262&playChapter=False    at 01:20       and 03:30

--------------------------------------------------------------------------------------------------------------
head:           its the last commit we made

you can do:
`$ git log HEAD`

--------------------------------------------------------------------------------------------------------------
```
git status

git diff     #(show what are the differences in the file)
```

you can also do:        git diff <PUT FILE NAME HERE>

```
git diff --staged   #(compare the file in the staging area with the repository file)

git diff HEAD HEAD~1      # (compare changes with HEAD and your last commit), (see changes of last commit)
```

--------------------------------------------------------------------------------------------------------------
`$ git rm <FILE NAME THAT YOU WANT TO DELETE>`

IT PERMANENTLY DELETES IT from your computer and from git!!!

--------------------------------------------------------------------------------------------------------------
`$ git mv <FILENAME TO RENAME> <NEW NAME>`

IT ALSO ADDS IT TO THE STAGING

--------------------------------------------------------------------------------------------------------------
`$ git mv <FILE TO BE MOVED> <FOLDER/FILE>`

--------------------------------------------------------------------------------------------------------------
add, commit and put message at the same time (only works for modified files):

`$ git commit -am "put your message here"   # ???`

--------------------------------------------------------------------------------------------------------------
lets say you screwed up index.html, what "git checkout" does is
delete index.html from my computer,
and replace it with
index.html from the REPOSITORY
it resets the file to how it looks in HEAD

#reset file

`$ git checkout -> index.html  `

`$ git checkout -> cats.html index.html`

--------------------------------------------------------------------------------------------------------------
> undoes your mistakes ???

`$ git checkout -f`

--------------------------------------------------------------------------------------------------------------
unstaging a file (off you added a file, to unadd it!!!):

`$ git reset HEAD myfile.html`

--------------------------------------------------------------------------------------------------------------
this adds up to the previous staging and commit it all together, changing also the message:

`$ git add . `    (you have to stage the thing you want to commit moron...)

`$ git add --all` (adds everything of all folders)



> #### if you don't want to change the message!

> #### add extra files that are in the staging area to be committed together with the last commit, using the last commit and its message

> `$ git commit --amend`



# if you want to change the message!
# DONT DO THIS AFTER YOU PUSH...
`$ git commit --amend -m "new message" `    if you are seeking for append or ammend, its amend...lol


> amend seems not to work when you change a line of code... (IT GIVES CONFLICTS ???)

> IF  there are errors when PUSHING, do a "git pull" and a "git push" ???

--------------------------------------------------------------------------------------------------------------
### retrieving old versions:

`$ git log`

`(get the SHA1  of the previous log)`

`$ git checkout  238832484238afe8 -> myfile.html`

`$ git status`

`$ git diff --staged`

`$ git log`

`$ git reset HEAD myfile.html`

`$ git checkout -> myfile.html`

--------------------------------------------------------------------------------------------------------------
### git log

`$ git reverse e3a76ae7283ae`    (reverts everything, its like a mirror image)

> p.s. IT MAKES THE COMMIT...

--------------------------------------------------------------------------------------------------------------

>(it repositions the HEAD, and "RECORDS" from there, deleting what is in front)
`$ git reset`

`$ git reset --soft e3a76ae7283ae` # DONT DO THIS AFTER YOU PUSH...

`$ git reset --mixed e3a76ae7283ae`

`$ git reset --hard e3a76ae7283ae` # DONT DO THIS AFTER YOU PUSH...

> remove the most resent commit (one commit before HEAD) and all its changes:
`$ git reset --hard HEAD~1` # DONT DO THIS AFTER YOU PUSH...

> its a good idea to open a file and save those logs, because RESET will not show the logs after the HEAD...

--------------------------------------------------------------------------------------------------------------
git clean         (deletes all untracked files in the folder) (this actually doesn't do anything)

git clean -n      (it shows what its going to delete)

git clean -f        (this actually permanently deletes it!!!!!)

git clean -f  -d  (the "-d" will delete the directories also)

--------------------------------------------------------------------------------------------------------------
IGNORING FILES:

nano .gitignore

(put the name there of the file)

examples:    (you can use REGULAR EXPRESSIONS)  (you can use the bang "!" to NOT IGNORE)        # http://rubular.com/ # for regular expressions


*.txt

*.php

folder/*.php

# you can comment like this

--------------------------------------------------------------------------------------------------------------
ignoring file in my computer:

nano /Users/kevinskoglund/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

--------------------------------------------------------------------------------------------------------------
remove files only from the staging area:

git rm --cached myfile.txt

--------------------------------------------------------------------------------------------------------------
I stopped watching here:     http://www.lynda.com/home/Player.aspx?lpk4=111292&playChapter=False

--------------------------------------------------------------------------------------------------------------
git branch                     (list the branches existing in the folder)

git branch erich               (create a branch with a named erich, if it doesn't exist )

git checkout erich           (go to that branch, if it exists)

git merge brian                 (here Im at erich's branch, if I type that command, it will bring extra files from brian to erichs repository, it will merge them, but just on ERICHS SIDE)


P.S.  the folders are updated instantly with changes, but not the open files


git branch -d brian    (delete a branch called "brian")

git checkout -b mybranch  it creates and goes to it !!!

--------------------------------------------------------------------------------------------------------------
 >  it copies the repository to the current folder your in.

git clone https://github.com/codeschool/RFZ2-ZombieTweets

--------------------------------------------------------------------------------------------------------------
set your name like this:

`git config --global user.name "brian"`

-----------------------
git help config    ???

--------------------------------------------------------------------------------------------------------------
git diff --sta­ged 

> shows the difference in the staged files

--------------------------------------------------------------------------------------------------------------
git reset­ HEAD ostri­ch.html 

> take a file off the staging area

--------------------------------------------------------------------------------------------------------------
to show colors:

git config --global color.ui true


--------------------------------------------------------------------------------------------------------------
add username and email:

git config --global user.name "brian spinos"



git config --global user.email brianspinos777@hotmail.com

--------------------------------------------------------------------------------------------------------------
> check who committed this!

git blame index.html

> you have to be inside the folder, or give it a  absolute path

--------------------------------------------------------------------------------------------------------------
To push our local repo to the GitHub server we'll need to add a remote repository:
how git push works:

> create a new repository on github.com, and get the link from there...

# perform a commit before pushing
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/brianspinos777/test.git # don't add the HTTPS, use the SSH, so you don't need to provide boring credentials latter...
git push -u origin master

> now you can change files, add them, commit therm... and do:

git push


The name of our remote is origin and the default local branch name is master.
The -u tells Git to remember the parameters, so that next time we can
simply run git push and Git will know what to do. Go ahead and push it!

`$ git remote add <name> <url>`

--------------------------------------------------------------------------------------------------------------
We can check for changes on our GitHub repository and pull down any new changes by running:

git pull origin master

or simply:

git pull

--------------------------------------------------------------------------------------------------------------
# stashing

`$ git stash --include-untracked` same as `$ git stash -u`

`$ git stash save --include-untracked "my message"`  same as `$ git stash save -u "my message"`



`$ git stash list`

`$ git stash branch foobar` <> create a new branch and puts the stash there ???

`$ git stash clear` delete all stashes



> you can clear stash after you apply it!!!

> show content of stash:
`$ git stash show -p stash@{0}`



> show stash with files:
`$ git stash show --name-only stash@{6}`




> delete a stash :
`$ git stash drop stash@{0}`



if you don't want to commit, but save it for latter:

`$ git stash`

if you want to work again in the stash:

`$ git stash apply`

`$ git stash apply <stuff from the stash list>` ???

`$ git stash apply --index`   ???

`$ git stash apply drop`  ???

`$ git stash apply pop`  ???


--------------------------------------------------------------------------------------------------------------
see the changes you just staged:

git diff --staged

--------------------------------------------------------------------------------------------------------------
You can unstage files by using the git reset command:

git reset brian/erich.txt

--------------------------------------------------------------------------------------------------------------
> to remove/delete a folder

`$ rm -rf <folder>`

`$ git rm -r folder_of_cats`

--------------------------------------------------------------------------------------------------------------
Resets your index and working directory to the state of your last commit.

`$ git reset --hard HEAD` # DONT DO THIS AFTER YOU PUSH...

--------------------------------------------------------------------------------------------------------------
# TAGS
> Tags a specific commit with a simple, human readable handle that never moves.

`$ git tag` list all tags

`$ git tag -a v1.0 -m 'this is version 1.0 tag'` Add a tag

`$ git tag -a "v1.3.2" -m "just created a tag brian"` Add a tag

`$ git checkout "v1.3.1"` retrieve a tag

`$ git push --tags` push to remote repository with a tag

--------------------------------------------------------------------------------------------------------------
Fetches all the objects from the remote repository that are not present in the local one.

git fetch origin

--------------------------------------------------------------------------------------------------------------
Fetches the files from the remote repository and merges it with your local one.
This command is equal to the git fetch and the git merge sequence.

git pull origin

--------------------------------------------------------------------------------------------------------------
Pushes all the modified local objects to the remote repository and advances its branches.

git push origin master


push branch to remote repository:
git push origin hamsters

--------------------------------------------------------------------------------------------------------------
Shows all the remote versions of your repository.

git remote
origin

git remote -v

--------------------------------------------------------------------------------------------------------------
see the branches in the remote repository

git branch -r

--------------------------------------------------------------------------------------------------------------
show information from the remote repository

git remote show origin

--------------------------------------------------------------------------------------------------------------
delete local branches that aren't on the remote repository (local branches that point to nothing in the remote repository)

git remote prune origin


--------------------------------------------------------------------------------------------------------------
### Shows information about a git object.

`$ git show`

--------------------------------------------------------------------------------------------------------------
### Lets you search through your trees of content for words and phrases.

` $ git grep "www.siteground.com" -> *.php`

--------------------------------------------------------------------------------------------------------------
### Removes objects that are no longer pointed to by any object in any reachable branch.

`$ git prune`

--------------------------------------------------------------------------------------------------------------
# GIT REBASE

> Do not rebase commits that you have pushed to a public repository.

[Git-Branching-Rebasing](http://git-scm.com/book/en/Git-Branching-Rebasing)

> With the rebase command, you can take all the changes that were committed on one branch and place them on another one.

`$ git checkout experiment`
`$ git rebase master`

> There is no difference in the end(between a merge and a rebase), but rebasing makes linear history.

> This places your server work on the bottom of your master work

`$ git rebase master server`

> Then, you can fast-forward the base branch (master):

`$ git checkout master`

`$ git merge server`  


> Now you can safely delete the other branches:

`$ git branch -d client`

`$ git branch -d server`

> If you treat rebasing as a way to clean up and work with commits before you push them, and if you only rebase commits that have never been available publicly, then you'll be fine. If you rebase commits that have already been pushed publicly, and people may have based work on those commits, then you may be in for some frustrating trouble.


--------------------------------------------------------------------------------------------------------------
how to remove all deleted files:

`$ git add -u`

> it updates all your changes

--------------------------------------------------------------------------------------------------------------
merge `<branch-name>` to the branch you are currently in, then you usually delete the `<branch-name>`, just saying...lol
if there are two same files with different content, it will have a conflict warning!!!

and in the file it will have the two versions.... choose one: example:
> HEAD is your changes, if you are doing a "git pull"

```
<<<<<<< HEAD
content1
=======
content2
>>>>>>> brian_branch
```

> you will need to fix the file, and add it and commit it!!!!

> P.S.: the file in the other branch will keep it self in the same state

`$ git merge <branch-name>`

--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------


# Rebase



`$ git checkout branch2`

`$ git rebase master` 

> master commits are going to be on the bottom, and the branch2 commits on top!


--------------------

`$ git rebase -i HEAD~3` <-- interactive rebase, of the last 3 commits before the newest commit ??? i guess its just the newest 3 commits...


> rebase interactive show oldest-to-newest commits (the older commit is at the top)  <-> reverse order from the git log




----------------------------------------------------------------------------------------------------------------------------
### interactive commands! in the editor that pops-up

`reword` change commit message, another editor will open,change, save and exit

-----------------------------------------------------------------
`edit`  slipt a commit, goes to the command line:

> here you can amend to one commit and the continue to the next...


# OR...

`git reset HEAD^`

> then you can add stuff and commit for the first commit, then add files and commit for the second one!!

now do :

`$ git rebase --continue`

`$ git log`

-----------------------------------------------------------------
`squash` merge a commit with the previous commit, in the interactive file, use squash on the bottom commit, if you want to merge it with the commit in the top!, then it will open another editor... change the commit message there.... the message should be the only uncomented line!

> then try:

`$ git log`


------------------------------------------------------------------



# REBASE END

------------------------------------------------------------------



### a log of thing you did:

`$ git reflog`



------------------------------------------------------------------------------------------------------------


### move to the previous commit:

`$ git reset HEAD~`
or
`$ git reset HEAD^`

> if you didn't want to do that do:
>  `$ git reflog`
>  `$ git reset HEAD@{1}`

------------------------------------------------------------------------------------------------------------
