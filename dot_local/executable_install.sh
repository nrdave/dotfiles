#!/bin/sh
# Creates symlinks from an app's bin and share folders in their folder
# to ~/.local/{share or bin}

if [ -z "$1" ]
  then echo "Program install directory must be given"
	  exit 1
else
	folder="$1"
fi

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

abs_folder=$(get_abs_filename $folder)


make_links () {
	in_dir=$1
	out_dir=$2

	mkdir -p "$out_dir"

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"

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

	echo "mkdir -p "$out_dir""
	mkdir -p "$out_dir"

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"

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
	make_links "$abs_folder/bin" "$HOME/.local/bin"

	for subdir in "applications" "man" "icons" "locale" "terminfo" "bash-completion" "zsh"; do
		make_links "$abs_folder/share/$subdir" "$HOME/.local/share/$subdir"
	done
else
	echo "Directory doesn't exist"
fi

