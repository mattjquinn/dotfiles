dotfiles
========

These are the dotfiles on my laptop running Debian 7. Most of the settings
are related to DWM, the window manager I'm running; dzen and conky run alongside
it to feed system information into the status bar. I usually plug two 21" Dell
monitors into the system; .xinitrc detects whether or not these displays are
plugged in, and configures them using xrandr if they are, before starting DWM.
The actual dotfiles are soft-linked to these files in a local clone of this
repository in my home directory; I use install.sh to create the links for newly
created files.

Here's what my system looks like when I start X; you can see dzen running in the upper
right, with data fed to it using conky:

![alt tag](https://raw.github.com/mquinn/dotfiles/master/images/debian7-dwm.png)

## Notes
* Use pavucontrol to adjust input/output devices; a recent system update (early 2016)
  is occasionally causing these to be muted even when the hardware switch indicates their not,
  and the best solution I've found is to check pavucontrol and uncheck the invariably
  checked muted button in that interface.
