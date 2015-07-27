#!/usr/bin/env bash
# No lines should be longer than 120 characters
# Save as .git/hooks/pre-commit

max_width=120

for file in $(git diff-index --name-status HEAD -- | cut -c3-) ; do
	if [ -f "$file" ]; then
		width=$(cat "$file" | awk '{ if (length($0) > max) max = length($0) }; END { print max }')
    	if [ "$width" -gt "$max_width" ]; then
			echo "Width of $file is to much ($width)"
        	exit 1
    	fi
	fi
done
exit 
