#!/usr/bin/env bash

if ! /usr/local/bin/mysides list | grep -c "Keybase ->" >/dev/null; then exit 0; fi

/usr/local/bin/mysides remove Keybase
