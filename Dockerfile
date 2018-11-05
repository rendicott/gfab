FROM ubuntu:16.04
ENV GOVERSION 1.10.5
ENV GOOS linux
ENV GOARCH amd64
RUN apt-get update
RUN apt-get install wget -y
RUN wget https://dl.google.com/go/go$GOVERSION.$GOOS-$GOARCH.tar.gz
RUN tar -C /usr/local -xzf go$GOVERSION.$GOOS-$GOARCH.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
RUN mkdir /root/go
ENV GOPATH /root/go/
RUN apt-get install make git ruby ruby-dev rubygems build-essential rpm vim -y
RUN gem install --no-ri --no-rdoc fpm

# now set up project
ENV GITHUBSRV github.com
ENV GITHUBORG rendicott
ENV PROJECTNAME gfab
ENV WD $GOPATH/src/$GITHUBSRV/$GITHUBORG/$PROJECTNAME
RUN mkdir -p $WD
ADD . $WD

WORKDIR $WD
RUN mv Dakefile Makefile

