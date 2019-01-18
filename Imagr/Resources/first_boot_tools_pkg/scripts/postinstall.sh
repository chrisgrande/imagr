#!/bin/bash

# post install script to kick off the launch agents after startosinstall installs them

echo "Loading the agents..."
launchctl load "$3"/Library/LaunchAgents/se.gu.it.LoginLog.plist
launchctl load "$3"/Library/LaunchDaemons/com.grahamgilbert.imagr-first-boot-pkg.plist

exit 0
