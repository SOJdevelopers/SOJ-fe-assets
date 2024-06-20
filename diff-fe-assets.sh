#!/bin/bash

folder_a="."
folder_b="../SOJ-front-end"
find "$folder_a" -type f -print0 | while IFS= read -r -d ''; do
	relative_path="${REPLY#$folder_a/}"
	if [[ "$relative_path" != .git* ]]; then
		echo "diff " $relative_path
		file_in_b="$folder_b/$relative_path"
		if [ -f "$file_in_b" ]; then
			diff "$REPLY" "$file_in_b"
		else
			echo "File does not exist in local: $file_in_b"
		fi
	fi
done
