# gfab
An attempt to make a common prefab structure for a golang web server as an os service that has the tarball, rpm, and deb packages all set up.

# prereqs
a linux environment with docker pre-installed

# Instructions
1. Clone this dir
1. remove the main.go file
1. add your go files
1. tweak Makefile and Dakefile to change your package name.
1. run `make`
1. check `./output` to see if all your stuff got built
1. if you're feeling lucky run `make testrpm`

# TODO
test deb packages, test rpms and debs to make sure they run as sysvinit, systemd, and upstart packages

