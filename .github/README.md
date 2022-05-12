# dotfiles
Configuration for setting up a new machine

1. Install homebrew:
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

2. Install `fish` and configure:
  i. Install with `brew install fish`
  ii. add `fish` to `echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells`

3. Download IBM Plex Mono from `https://github.com/IBM/plex` and https://github.com/ryanoasis/nerd-fonts/blob/master/src/glyphs/Symbols-1000-em%20Nerd%20Font%20Complete.ttf


TODO: Add sections for:
- install & configure fish shell
- install & configure neovim:
- other: \
    exa mapped to ls (incl. `la`)

## Misc settings

### Use touch ID for sudo

This is easy to do, all that's required is appending the following to `/etc/pam.d/sudo`:
```
auth sufficient pam_tid.so
```

Do **not** write and quit this file without checking the effects, and leave the original contents open in a second editor with privileges to write the file out. The first time I tried this I accidently deleted the file (I'm not sure how) which left me unable to sudo. If this happens, an admin login + Finder allows you to put it back.
