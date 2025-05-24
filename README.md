# Installation
```
cp -r ~/.config ~/.config.backup

if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/notVansana/dotfiles.git ~/dotfiles
fi

cp -r ~/dotfiles/.oh-my-bash ~/.oh-my-bash

for file in ~/dotfiles/config/*; do 
  cp -r "$file" ~/.config/
done
```
