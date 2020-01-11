Dark* GTK2 & GTK3 themes
============

These themes are auto-generated from the very excellent
[DarkCold](https://github.com/originalseed/darkcold) and
[DarkMint](https://github.com/originalseed/darkmint) themes. You'll need to
install ImageMagick which includes the `convert` tool.

```
$ make
```

The following themes are defined:

- **DarkBlood**: generated from DarkMint by swapping R and G channels.

- **DarkFire**: generated from DarkBlue by swapping R and B channels, then
  cloning the new B into the G channel. Without this latter step it looks more
  orange, but I wanted red instead.
