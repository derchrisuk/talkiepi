talkiepi:
	HOME=$$(pwd) git config --global http.sslVerify false
	wget --no-check-certificate https://dl.google.com/go/go1.11.linux-armv6l.tar.gz
	tar zxf $$(pwd)/go1.11.linux-armv6l.tar.gz
	mkdir $$(pwd)/gopath
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/dchote/gopus
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/dchote/talkiepi
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go build -o talkiepi cmd/talkiepi/main.go

install: talkiepi
	mkdir -p $$(pwd)/debian/talkiepi/usr/local/bin
	install -m 0755 talkiepi $$(pwd)/debian/talkiepi/usr/local/bin 

