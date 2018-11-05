#!/bin/bash

rpm -iv $INSTALL_FILE_PREFIX/$INSTALL_FILE
yum install which -y
which qfab
