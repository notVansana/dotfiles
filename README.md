# Installation
```
cp -r ~/.config ~/.config.backup

if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/notVansana/dotfiles.git ~/dotfiles
fi

for file in ~/dotfiles/home/*; do
    cp -r "$file" ~/
done

for file in ~/dotfiles/config/*; do 
  cp -r "$file" ~/.config/
done
```
