# ana TODO

A TODO list that's version controlled so that I can keep track of what work I've
done and have left TODO. Commit messages can have extra details on how things
can be (or were) accomplished, or extra context as to why said things have to be
done; let your imagination run wild with this one.

This plugin makes use of a bad file format I made up one day and is a work in
progress. Additionally, the plugin will auto-indent tasks and provide folding
for your TODO files. See `:help folding` for common folding commands.

Eventually, maybe, I'll write functionality to do a few more things like:  
- Printing out high priority tasks  
- Syntax highlighting that depends on completion/priority of tasks  
- Automatic purging of files after tasks have been completed for some time  
- Mirroring of .atd files' content to hidden .yaml files for...reasons
- Others I'm too lazy to type in right now

## Installation

### Installing using Vundle

1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
2. Add `Plugin 'analessthanthree/anaTODO'` to the Vundle section of your .vimrc
3. Source your .vimrc by either:
	- Saving, closing, and re-opening the file
	- Saving the file within vim and typing `:source %`
4. Run `PluginInstall`

Initialize a directory as a git repository  
`mkdir <my/todo/directory> && cd <my/todo/directory> && git init`  
 Make your TODO lists in subdirectories of here with the file extension `.atd`
(Ana ToDO) so that `vim` recognizes the filetype and sources the appropriate
plugins.

The way I *want* to organize this is:  
- Major projects/duties get their own directory
- Miscellaneous projects/duties tasks get their own directory (e.g.
  administrative tasks)
- Tasks within those categories (ie, directories) get their own file

The files will have a certain format, as outlined below, which aims to be both
human and machine readable for potential parsing of the files to perform
processing using a script.

## TODO file format:

```
%%% DATE: 2022-12-16 # Friday
### A date entry is denoted by triple percent signs "%%%" followed by a space,
    the word "DATE:", and finally the date in "yyyy-mm-dd" format. Optionally, a
    pound symbol followed by the day of the week can be appended after the date.
    A date entry is never indented

### Comments are made with triple pound symbols, and can be found at the
    beginning of any line.

### In general, indentation denotes the scope of entries
    So I can insert new lines
    in a wacky way and
    still
    be in a comment until the next entry

### Indents should be "worth" 4 spaces

### Nesting entries is allowed
    ### As you can imagine, a nested entry "belongs" to its parent

### The "p" character within a task task entry (see below) denotes the status of
    the task, and is one of the following characters, in order of decreasing
    priority:
    H,h,M,m,L,l
    Corresponding to high, medium, and low, priority with each priority level
    having two sub-levels, respectively.
    The following additional characters are also allowed:
    i (in progress)
    x (completed task)
    a (abandoned task, pick up at some point)
    A (super abandoned task, will likely never pick up)
    Lastly, "p" can be a space character, and is understood to denote the "M"
    priority

### In practice, comments (or anything in a TODO list!) should never be this
    long. 

[p] Task 1
    *** Notes are denoted by triple asterisks, should be short, and correspond
        to the object one indentation level above
        ### Notes differ from comments in that comments are meant to be ignored
            by any parsers that may be written for .atd files
    *!* An extra important note has an "!" in place for the middle asterisk
    [p] Step 1
        *** Note for Step 1
    [p] Step 2
    [p] Step 3
    [p] etc...

### Top level entries (i.e., no indentation) can be seperated by a new line
    (preferred) or not

[p] Task 2
    [ ] Step 1
    [ ] Step 2
    [ ] Step 3
    [ ] etc...

[ ] Task 3

[ ] Task 4
```

## Summary of entry types

Entry types are denoted by a set of three characters, followed by a space. An
entry encompasses everything at a smaller indentation level. There are currently
4 types of entries:
`%%% DATE: yyyy-mm-dd # Day of week`  
Which are placed reverse chronologically  
`### Comments`  
Which are fully ignored when parsing the TODO files  
`*** Notes`  
Which can span multiple lines, but ideally should be short, and  
`[p] Tasks`  
where "p" denotes the status/priority of the tasks. 
Tasks and notes can be nested within other task objects.

## Keybinds and Commands

Currently there is a single custom mapping:  
- \<leader\>d  
	- Appends the current date to the top of the file and puts you in insert
	  mode below the new line  
	- Normal mode only  
	- The \<leader\> key is set to the "\" (backslash) key by default on every (to
	  my knowledge) vim installation

Other useful mappings to have in your `~/.vimrc`:  

```
" Easier windowing
" Next window
nnoremap <c-j> <c-w>w
" Previous window
nnoremap <c-k> <c-w>W

" Explore commands
nnoremap <leader>e :Explore<cr>
nnoremap <leader>h :Hexplore<cr>
nnoremap <leader>v :Vexplore<cr>
nnoremap <leader>t :Texplore<cr>
nnoremap <leader>r :Rexplore<cr>
```

These normal mode mappings allow you to easily change to the next/previous vim
window and:  
- Open netwr (vim's built in file explorer) in the current split  
- Open netwr in a new horizontal split  
- Open netwr in a new vertical split  
- Open netwr in a new tab  
- Return to netwr after having opened a buffer using netwr
