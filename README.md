# Nightsky, my personal Arch Linux setup

![Nightsky!](https://github.com/kerichdev/nightfiles/blob/main/banner.nightsky?raw=true "Nightsky Banner")

## What is it based on?

Nightsky includes various resources from other projects, like:

- [Catppuccin (catppuccin org)](https://github.com/catppuccin/catppuccin)

## Installation and setup

Clone the repo locally. Since it includes submodules from my own forks to preserve licenses, make sure to clone recursively:

```shell
git clone --recursive https://github.com/kerichdev/nightfiles
```

Firstly, you should install the packages. Open a terminal of choice (Will be replaced with alacritty), and install your favorite AUR helper. Mine is `yay`, so i will go by it.

To install the packages needed for the setup, go to the directory where you cloned the repo, and do:

```shell
yay -S - < deplist.nightsky
```

Then follow the steps your AUR helper gives you.

Before going further, you can try running `confirm_install.sh` to make sure if everything had installed properly, and if it hadn't, the script will re-run the installation of missing packages for you.

*The deplist may be incomplete! If you notice something not working, feel free to add any packages into the list, and I will see if I did, in fact, miss them.*

Then, move the contents of the repo `.config` folder, to your `.config` folder in `$HOME` (`/home/YOUR_USERNAME/.config/`).

### Betterlockscreen

Betterlockscreen requires some additonal setup. First of all, once you copy the config and the wallpaper to their respective folders, generate a lockscreen pre-render:

```shell
betterlockscreen -u ~/Wallpapers/tropic_island_night.jpg
```

Then, enable the systemd service for automatic lock-on-suspend:

```shell
systemctl enable betterlockscreen@$USER
```

### btop

Because of how btop handles configs, before I make an installation script, to apply the catppuccin theme you have to do one of the following:

1. Open `btop`, click <kbd>Esc</kbd>, choose *Themes* and find *Catppuccin*. Choose it, and you're good to go.

2. Open `btop.conf` in the btop config folder, and change the `$USER` in the `color_theme` line to your username.

### zsh

First of all, refer to the installation methods of oh-my-zsh. Only replace the `oh-my-zsh.sh` in `$HOME/.oh-my-zsh` after it is installed.

Then, look for all aur-installed plugins in `/usr/share/zsh/plugins`.

Simply copy the `zsh-autosuggestions` and `zsh-syntax-highlighting` to `$HOME/.oh-my-zsh/custom/plugins`.

The `powerlevel10k` theme is located in `/usr/share` under `zsh-theme-powerlevel10k` - copy it to `$HOME/.oh-my-zsh/custom/themes`, and rename the folder to `powerlevel10k`.

### bluetooth: experimentals

For proper battery percentage display with the `bt.sh` module from polybar, you will have to add the `--experimental` flag to `bluetooth.service`.:

1. `sudo systemctl edit --full bluetooth.service`

2. To the end of the `ExecStart` line, append `--experimental` flag

3. Save, and restart the service: `systemctl restart bluetooth.service`

## KEEP IN MIND, THE REPO IS EXTREMELY INCOMPLETE, I'M WORKING ON FINISHING IT UP. You'll probably have to set up a lot of stuff yourself
