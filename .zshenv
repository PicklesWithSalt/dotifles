export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH=$PATH:~/.local/bin

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chromium"

# Visual Configuration
export QT_STYLE_OVERRIDE=kvantum
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

# Rust
source ~/.cargo/env
export RUSTC_WRAPPER=sccache
