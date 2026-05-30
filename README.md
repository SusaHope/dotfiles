# dotfiles

Personal dotfiles for zsh, tmux, git and vim. Lives at `~/Github/dotfiles/`.

## What's here

| File/Folder | Purpose | Wired up via |
|---|---|---|
| `alias.sh` | Shell aliases | sourced in `~/.zshrc` |
| `tmux.conf` | tmux config | sourced in `~/.tmux.conf` |
| `git/` | Git aliases & helper scripts | `~/.gitconfig` (directly) |
| `vim/` | Vim profiles (basic, dev, web, python, ruby, writing) | `~/.vimrc` + `~/.plugins.vim` |

## How things are connected

**zsh** (`~/.zshrc`) sources `alias.sh` directly:
```
source /Users/susanne/Github/dotfiles/alias.sh
```

**tmux** (`~/.tmux.conf`) sources `tmux.conf` directly:
```
source /Users/susanne/Github/dotfiles/tmux.conf
```

**git** (`~/.gitconfig`) contains the aliases inline — `git/git-config.sh` can regenerate them from scratch if needed.

**vim** (`~/.vimrc`) sources the basic and dev profiles. `~/.plugins.vim` manages vim-plug plugins.

## Git helper scripts

- `git/git-github-pr.sh` — opens a GitHub PR URL in the browser (`git prn` = new PR, `git pro` = open existing)
- `git/git-fetch-merge.sh` — fast-forward pull helper
- `git/git-status-all.sh` — git status across multiple repos
- `git/git-config.sh` — regenerates `~/.gitconfig` from scratch (run if setting up a new machine)
