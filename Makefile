talkiepi:
	HOME=$$(pwd) git config --global http.sslVerify false
	ifeq ($$(ARCH),arm64)
	  wget --no-check-certificate https://golang.org/dl/go1.14.6.linux-arm64.tar.gz
	  tar zxf $$(pwd)go1.14.6.linux-arm64.tar.gz
	endif
	ifeq ($$(ARCH),armhf)
	  wget --no-check-certificate https://golang.org/dl/go1.14.6.linux-armv6l.tar.gz
	  tar zxf $$(pwd)go1.14.6.linux-armv6l.tar.gz
	endif
	mkdir $$(pwd)/gopath
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/derchrisuk/gopus
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go get -insecure github.com/derchrisuk/talkiepi
	HOME=$$(pwd) GOPATH=$$(pwd)/gopath GOCACHE=off $$(pwd)/go/bin/go build -o talkiepi cmd/talkiepi/main.go

install: talkiepi
	mkdir -p $$(pwd)/debian/talkiepi/usr/local/bin
	install -m 0755 talkiepi $$(pwd)/debian/talkiepi/usr/local/bin 

