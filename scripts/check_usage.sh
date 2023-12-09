#!/bin/bash

bytesToHumanReadable() {
	echo "got $1"
	local i=${1:-0} d="" s=0 S=("Bytes" "KiB" "MiB" "GiB" "TiB" "PiB" "EiB" "YiB" "ZiB")
	while ((i > 1024 && s < ${#S[@]} - 1)); do
		printf -v d ".%02d" $((i % 1024 * 100 / 1024))
		i=$((i / 1024))
		s=$((s + 1))
	done
	echo "$i$d ${S[$s]}"
}

# TODO I can't get this to print the correct size
# This may be a bad idea for a status line plugin as this command takes a minute to run
main() {
	case $PWD/ in
	# $HOME/*) echo "$(diskus | numfmt --to=iec-i --format='%.3f')" ;;
	$HOME/*) echo "$(bytesToHumanReadable "$(diskus)")" ;;
	*) echo "NAN" ;;
	esac
}

# main
