folder=~/"dotfilesgit/dotfiles"
echo "Creating symlinks to dotfiles in folder $folder"
cd "$folder"
for word in .*; do
	[[ -f $word ]] || continue
	ln -s -v "$folder/$word" ~/"$word"
done
cd ~
