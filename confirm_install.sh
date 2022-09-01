if pacman -Qq - < deplist.nightsky >> /dev/null ; then
    echo "All packages are installed."
    exit 0
else
    yay -S --needed - < deplist.nightsky
fi