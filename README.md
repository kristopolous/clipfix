# clipfix

Let's try our best to unfuck the xorg clipboard.

The objective is two-fold:
## Software

 * Terminal: one of 
   * uxterm
   * xterm
   * alacritty
   * kitty
 * tmux
 * ssh
 * Editor: one of
   * vim
   * emacs

The stack should be 100% consistent 100% of the time on 100% of the machines for 100% of the configurations.

That means

 * terminal -> ( none / tmux / ssh / editor ) ...

should work. This mean if you do

```bash
    $ tmux
    $ ssh blahblah
    $ $editor
```

Then copy and paste shouldn't magically change. It shouldn't magically change for tmux. It shouldn't magically change for ssh, it shouldn't magically change, ever, at all, ever. Never. 
It should be utterly predictable every time.

## Notes:
### tmux
as far as I can tell, https://github.com/tmux/tmux/wiki/Clipboard is totally fucking wrong.

```bash
set-clipboard on
```
is the only option that works for OSC-52. Tried compiling from HEAD, running with no other options, `external` is a myth. You need on. This _likely_ goes to `XA_CLIPBOARD`

## The problems

In 1984 someone decided that insert on select was a good idea. They were wrong. This is a terrible idea. It gets clobbered trivially. So although there's `CUT_BUFFER[0-9]`, `XA_PRIMARY`, `XA_SECONDARY` and `XA_CLIPBOARD` effectively just `XA_PRIMARY` and `XA_CLIPBOARD` are used.

## Clipboards
 
### XA_PRIMARY
 * inserts on select - basically everywhere. Using it AS the clipboard is a bad idea because it gets clobbered very very easily. 
 * paste on middle click - extremely inconsistent - vim needs to be in insert mode. tmux has issues, 

### XA_CLIPBOARD
 * insert
 * paste


* clip-peek : a way to see the two clipboards that most of xorg uses, XA_PRIMARY and XA_CLIPBOARD
* clip-swap : a swapper between XA_PRIMARY and XA_CLIPBOARD followed by `clip-peek`


## Todo add

* .vimrc
* .Xresources
* alacritty.toml
* kitty.conf
* .tmux.conf
* .ssh/config
