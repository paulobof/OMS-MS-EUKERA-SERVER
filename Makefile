build:
	mvn complile

package:
	mvn package

docker-build:
	docker build -t eureka-server:1.0 .