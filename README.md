# niri-dotfiles-GruvboxDark
my niri dotfiles setup

my niri dotfiles based on gruvbox dark theme, they are based on XXXXXX's dotfiles and are modified to march my daily workflow

as opposed to regular dotfiles i guess, they are very simplified and dont include any overcomplicated or advanced stuff, theres no 54327890 different keybinds or 629873449 different gui stuff running in the background

Graphical elements:
  rofi launcher
  waybar
  niri
  awww with a wallpaper script (credit goes to XXXXX)

Background elements:
  mako
  pavucontrol commands

Applications and whatnots:
  fish
  alacritty / kitty
  fastfetch (ofc i had to)
  power-profiles-daemon
  and other


  if i ever make an install script, its gonna ask you for each thing if you want to override your current config with these ones (with backups ofc). As i believe that people would want to download/use only a part of these, it would be stupid to make the install script just "yh im replacing everything, figure the rest out".
  
  
rofi is kinda the swiss knife here, used in these ways:
- dmenu
- power menu (credits to https://github.com/jluttine/rofi-power-menu)
- window switcher
  

if you dont see anything in the files, well wait until i make a release lol its not gonna be instant, but for the moment here are some screenshots of the approximate result

[screenshots here]

if you want to add theming for other apps / thingamabobs i'd be more than happy to invite you to make a PR, add whatever theming you want, modify the install script and do your thing, *remember that the purpose is to make this as simple as possible, and let whoever wants to use these to choose what they want to install or not*

the script install.sh is VERY experimental AND NOT YET WORKING; FOR NOW INSTALL THEM MANUALLY
