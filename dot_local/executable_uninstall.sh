#!/bin/sh
# Creates symlinks from an app's bin and share folders in their folder
# to ~/.local/{share or bin}

if [ -z "$1" ]
  then echo "Program uninstall directory must be given"
	  exit 1
else
	folder="$1"
fi

delete_links () {
	in_dir=$1
	out_dir=$2

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"

		files=$(find . -type f)

		cd "$out_dir"
		for file in $files; do
			rm "$file"
			if [ "$(dirname $file)" != "." ]; then
				rmdir --ignore-fail-on-non-empty "$(dirname $file)"
			fi
		done
		

		rmdir --ignore-fail-on-non-empty "$out_dir"
		cd "$HOME/.local"
	fi
}

print_links () {
	in_dir=$1
	out_dir=$2

	if [ -d "$in_dir" ] && [ -d "$out_dir" ]; then
		cd "$in_dir"

		files=$(find . -type f)

		echo "cd "$out_dir""
		for file in $files; do
			echo "rm "$file""
			if [ "$(dirname $file)" != "." ]; then
				echo "rmdir --ignore-fail-on-non-empty "$(dirname $file)""
			fi
		done
		echo "rmdir --ignore-fail-on-non-empty "$out_dir""
		cd "$HOME/.local"
	fi
}

if [ -d "$folder" ]; then 
	delete_links "$HOME/.local/$folder/bin" "$HOME/.local/bin"

	for subdir in "applications" "man" "icons" "locale" "terminfo"; do
		delete_links "$HOME/.local/$folder/share/$subdir" "$HOME/.local/share/$subdir"
	done
else
	echo "Directory doesn't exist"
fi

