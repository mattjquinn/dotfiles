#!/bin/sh

for name in *; do
	target="/usr/local/bin/$name"
	if [ -e "$target" ]; then
		if [ ! -L "$target" ]; then
			echo "WARNING: $target exists but is not a symlink."
		fi
	else
		if [ -f "$name" ] && [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
			echo "Creating $target"
			sudo ln -s "$PWD/$name" "$target"
		fi
	fi
done
