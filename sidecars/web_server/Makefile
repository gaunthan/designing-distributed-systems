all: image

server: hello-server/main.go
	(cd hello-server/ && go build)

image: server
	docker build -t server/hello_server:v1 .

clean:
	rm server/hello_server -f
	docker stop hello_server
	docker rm hello_server
	docker rmi server/hello_server:v1
