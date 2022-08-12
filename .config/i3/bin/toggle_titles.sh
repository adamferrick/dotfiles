#/bin/bash

destination="$(readlink ~/.config/i3/titles.conf)"

if [[ $destination == "$HOME/.config/i3/visible_titles.conf" ]]
then
    polybar-msg cmd hide
    ln -sf ~/.config/i3/hidden_titles.conf ~/.config/i3/titles.conf
    i3-msg reload
elif [[ $destination == "$HOME/.config/i3/hidden_titles.conf" ]]
then
    polybar-msg cmd show
    ln -sf ~/.config/i3/visible_titles.conf ~/.config/i3/titles.conf
    i3-msg reload
fi
