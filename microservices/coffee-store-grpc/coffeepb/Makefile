all:
	protoc -I/usr/local/include -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--go_out=plugins=grpc:. \
		service.proto
	protoc -I/usr/local/include -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--grpc-gateway_out=logtostderr=true:. \
		service.proto
	protoc -I/usr/local/include -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--swagger_out=logtostderr=true:. \
		service.proto
	go generate .
# brew install protoc
# https://github.com/grpc-ecosystem/grpc-gateway
# go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
# go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
# go get -u github.com/golang/protobuf/protoc-gen-go
