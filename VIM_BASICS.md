# Vim Essential Commands Reference

## Movement

### Basic
- `h` `j` `k` `l` - Left, down, up, right
- `w` `b` - Next/previous word
- `e` - End of word
- `0` `$` - Start/end of line
- `gg` `G` - Start/end of file
- `{` `}` - Previous/next paragraph

### Scrolling
- `Ctrl+d` - Scroll down half page
- `Ctrl+u` - Scroll up half page
- `Ctrl+f` - Page down
- `Ctrl+b` - Page up
- `zz` - Center cursor on screen

### Jump
- `%` - Jump to matching bracket
- `*` - Search word under cursor (forward)
- `#` - Search word under cursor (backward)

## Search & Replace

- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next match
- `N` - Previous match
- `:%s/old/new/g` - Replace all in file
- `:%s/old/new/gc` - Replace with confirmation

## Editing

### Insert Mode
- `i` - Insert before cursor
- `a` - Insert after cursor
- `I` - Insert at line start
- `A` - Insert at line end
- `o` - Open line below
- `O` - Open line above

### Delete
- `x` - Delete character
- `dw` - Delete word
- `dd` - Delete line
- `d$` - Delete to end of line
- `d0` - Delete to start of line
- `dG` - Delete to end of file

### Copy (Yank)
- `yy` - Yank line
- `yw` - Yank word
- `y$` - Yank to end of line
- `y0` - Yank to start of line

### Paste
- `p` - Paste after cursor
- `P` - Paste before cursor

### Change
- `cw` - Change word
- `cc` - Change line
- `c$` - Change to end of line
- `C` - Change to end of line (same as c$)

### Other
- `u` - Undo
- `Ctrl+r` - Redo
- `.` - Repeat last command
- `~` - Toggle case
- `>>` `<<` - Indent/unindent line

## Visual Mode

### Entering Visual Mode
- `v` - Visual mode (character-wise)
- `V` - Visual line mode
- `Ctrl+v` - Visual block mode
- `gv` - Reselect last visual selection

### Selecting Text Blocks
- `viw` - Select inside word
- `viW` - Select inside WORD (includes punctuation - great for URLs!)
- `vaw` - Select around word (with space)
- `vaW` - Select around WORD (with space)
- `vip` - Select inside paragraph
- `vi"` - Select inside quotes
- `vi(` - Select inside parentheses

### Visual Mode + Motions
- `v + e` - Visual to end of word
- `v + $` - Visual to end of line
- `v + G` - Visual to end of file
- `v + w` - Visual forward by word
- `v + }` - Visual to next paragraph

### Visual Mode + Find
- `vf<char>` - Visual to character (inclusive)
- `vt<char>` - Visual till character (exclusive)
- `vF<char>` - Visual to character backward
- `vT<char>` - Visual till character backward

### Example: Selecting a URL
```
Text: Check out https://github.com/user/repo for info
Method 1: viW  (cursor on URL - selects whole URL)
Method 2: v + e + e + e  (extend by words)
Method 3: vf<space>  (select until next space)
```

### In Visual Mode
- `y` - Yank selection
- `d` - Delete selection
- `c` - Change selection
- `>` `<` - Indent/unindent
- `u` `U` - Lowercase/uppercase
- `o` - Toggle cursor to other end of selection

## Text Objects

### Inner (i) vs Around (a)
- `iw` `aw` - Inner/around word
- `i"` `a"` - Inside/around quotes
- `i'` `a'` - Inside/around single quotes
- `i(` `a(` - Inside/around parentheses
- `i[` `a[` - Inside/around brackets
- `i{` `a{` - Inside/around braces
- `it` `at` - Inside/around HTML tag
- `ip` `ap` - Inner/around paragraph

### Common Combinations
- `vi(` - Select inside parentheses
- `va{` - Select around braces (including braces)
- `di"` - Delete inside quotes
- `ci'` - Change inside single quotes
- `yip` - Yank paragraph
- `dap` - Delete around paragraph

## Marks & Jumps

- `ma` - Set mark 'a' at cursor
- `` `a `` - Jump to mark 'a'
- `''` - Jump to previous position
- `Ctrl+o` - Jump to older position
- `Ctrl+i` - Jump to newer position

## Window Management

- `Ctrl+w s` - Split horizontal
- `Ctrl+w v` - Split vertical
- `Ctrl+w w` - Switch windows
- `Ctrl+w q` - Close window
- `Ctrl+w h/j/k/l` - Navigate to window

## Multiple Lines

- `5dd` - Delete 5 lines
- `3yy` - Yank 3 lines
- `10j` - Move down 10 lines
- `4>>` - Indent 4 lines

## Macros

- `qa` - Start recording macro in register 'a'
- `q` - Stop recording
- `@a` - Play macro 'a'
- `@@` - Repeat last macro

## Tips

- **Count + Motion**: Most commands accept a count (e.g., `3w`, `5dd`)
- **Operator + Text Object**: `d + i(` = delete inside parentheses
- **Dot repeat**: `.` repeats the last change (powerful!)
- **Visual then operate**: Select with `v`, then `d/y/c`
