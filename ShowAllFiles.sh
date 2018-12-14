#!/usr/bin/env bash

# Hidden File Toggle
#
#
# <bitbar.title>Hidden File Toggle</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>mkennedy</bitbar.author>
# <bitbar.author.github>cnfn</bitbar.author.github>
# <bitbar.desc>Show All Hidden Files Toggle</bitbar.desc>
# <bitbar.dependencies>bash</bitbar.dependencies>
#

export PATH=$PATH:/usr/local/bin

# Hack for language not being set properly and unicode support
export LANG="${LANG:-en_US.UTF-8}"

showFileState=$(defaults read com.apple.finder AppleShowAllFiles 2> /dev/null)

if [ "$1" == "hideFiles" ]; then
	/usr/bin/defaults write com.apple.finder AppleShowAllFiles -boolean false
	/usr/bin/killall Finder
else
	/usr/bin/defaults write com.apple.finder AppleShowAllFiles -boolean true
	/usr/bin/killall Finder
fi

echo "Hidden Files"
echo "---"
if [ "$showFileState" == "1" ]; then
	echo "Showing hidden files"
else
	echo "Not showing hidden files"
fi
echo "---"
if [ "$showFileState" == "1" ]; then
	echo "Hide all files | bash='$0' param1=hideFiles"
else
	echo "Show all files | bash='$0' param1=showFiles"
fi


