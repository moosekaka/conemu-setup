folder=~/"dotfilesgit/dotfiles"
folder2=~/"dotfilesgit/gitwrapper"

# create symlinks for dotfiles
echo "Creating symlinks to dotfiles in folder $folder"
cd "$folder"
for word in .*; do
	[[ -f $word ]] || continue
	ln -s -v "$folder/$word" ~/"$word"
done

# copy wrapper files to call p4merge in Git
mkdir -p /usr/local/bin
echo "Copying git config wrapper files to /usr/local/bin"
cd "$folder2"
for word in *; do
	[[ -f $word ]] || continue
	echo "$word copied!"
	cp "$word" /usr/local/bin
done
	
cd ~
