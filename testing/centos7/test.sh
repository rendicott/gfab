#!/bin/bash
rpm -iv $INSTALL_FILE_PREFIX/$INSTALL_FILE
gfab &
curl http://localhost:8080/hello/dude


