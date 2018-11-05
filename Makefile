projectName := gfab
shareDir := $(shell pwd)/output
containerPath := /tmp/output
containerPathScripts := /tmp/scripts

testscripts_centos7 := $(shell pwd)/testing/centos7

installfile_rpm := $(shell ls output/*.rpm | xargs -n 1 basename)
installfile_deb := $(shell ls output/*.deb | xargs -n 1 basename)

build: clean prereq buildcontainer runbuild

buildcontainer:
	docker build . -t $(projectName)
runbuild:
	docker run -v $(shareDir):$(containerPath) -e BUILD_DIR="$(containerPath)" -it $(projectName) make build 

testrpm:
	docker run \
		-v $(shareDir):$(containerPath) \
		-v $(testscripts_centos7):$(containerPathScripts) \
		-e INSTALL_FILE_PREFIX="$(containerPath)" \
		-e INSTALL_FILE="$(installfile_rpm)" \
		-t centos:7 $(containerPathScripts)/test.sh 
	
testrpm_debug:
	docker run \
		-v $(shareDir):$(containerPath) \
		-v $(testscripts_centos7):$(containerPathScripts) \
		-e INSTALL_FILE_PREFIX="$(containerPath)" \
		-e INSTALL_FILE="$(installfile_rpm)" \
		-it centos:7 /bin/bash

	
debug: prereq buildcontainer
	docker run -v $(shareDir):$(containerPath) -e BUILD_DIR="$(containerPath)" -it $(projectName) /bin/bash 

prereq:
	mkdir $(shareDir)

clean:
	rm -rf $(shareDir)
