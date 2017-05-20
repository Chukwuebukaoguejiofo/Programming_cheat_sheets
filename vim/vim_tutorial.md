# Vim tutorial


```bash
insert i # insert mode
escape esc # not insert mode
```

# goto's

```bash
  beginning of line: 0
  beginning of line and append: I
  end of line and append: A
  beginning of file: gg
  last line: G
  beginning of word in a line: w
  beginning of previous word: b
  line 34:    34G
  apend at end of file: GA
```

# cursor

```bash
  right:  l   3l
  left:   h    4h
  up:     k    10k
  down:   j    23j
```

# edit
```bash
  delete n character on left of cursor:  x   3x
  delete whole line: dd
  undo:     u   4u
  redo: ctrl + r
  ```

```bash
# create file:
$ vi demo.txt


<ESC> :q	#Quit vim
<ESC> :q!	#Quit without saving changes i.e. discard changes
<ESC> :r #fileName	Read data from file called fileName
<ESC> :wq	#Write and quit (save and exit)
<ESC> :w #fileName	Write to file called fileName (save as)
<ESC> :w! #fileName	Overwrite to file called fileName (save as forcefully)


```
