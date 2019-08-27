#!/usr/bin/env bash

#
# Install/reinstall the "remove Keybase from Finder sidebar" script & launchctl job.
#

set -ux

command -v brew >/dev/null || { echo "Installation requires Homebrew; see https://brew.sh to install it."; exit 1; }
command -v mysides >/dev/null || brew cask install mysides

cp -f ./run.sh /usr/local/bin/com.dzombak.remove-keybase-finder-favorite
chmod +x /usr/local/bin/com.dzombak.remove-keybase-finder-favorite

mkdir -p "$HOME/Library/LaunchAgents/"

if launchctl list | grep -c com.dzombak.remove-keybase-finder-favorite >/dev/null; then
	launchctl unload "$HOME/Library/LaunchAgents/com.dzombak.remove-keybase-finder-favorite.plist"
	rm -f "$HOME/Library/LaunchAgents/com.dzombak.remove-keybase-finder-favorite.plist"
fi

cp -f ./com.dzombak.remove-keybase-finder-favorite.plist "$HOME/Library/LaunchAgents/"
launchctl load "$HOME/Library/LaunchAgents/com.dzombak.remove-keybase-finder-favorite.plist"
