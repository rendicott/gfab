#/bin/bash
USERGROUP=gfab
groupadd $USERGROUP
useradd -g $USERGROUP -r -s /bin/false $USERGROUP
