#!/bin/sh
# Creates symlinks from an app's bin and share folders in their folder
# to ~/.local/{share or bin}

if [ -z "$1" ]
  then echo "Program install directory must be given"
	  exit 1
else
	folder="$1"
fi

make_links () {
	in_dir=$1
	out_dir=$2

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"
		mkdir -p "$out_dir"

		files=$(find . -type f)

		for file in $files; do
			cd "$out_dir"
			mkdir -p "$(dirname $file)"
			cd "$(dirname $file)"
			ln -sf "$in_dir/$file"
			cd "$in_dir"
		done
		cd "$HOME/.local"
	fi
}

print_links () {
	in_dir=$1
	out_dir=$2

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"
		echo "mkdir -p "$out_dir""

		files=$(find . -type f)

		for file in $files; do
			echo "cd "$out_dir""
			echo "mkdir -p "$(dirname $file)""
			echo "cd "$(dirname $file)""
			echo "ln -sf "$in_dir/$file""
			echo "cd "$in_dir""
		done
		cd "$HOME/.local"
	fi
}

if [ -d "$folder" ]; then 
	make_links "$HOME/.local/$folder/bin" "$HOME/.local/bin"

	for subdir in "applications" "man" "icons" "locale" "terminfo"; do
		make_links "$HOME/.local/$folder/share/$subdir" "$HOME/.local/share/$subdir"
	done
else
	echo "Directory doesn't exist"
fi

