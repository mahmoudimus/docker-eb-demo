NAME=victorlin/echoapp
VERSION=`git describe`
CORE_VERSION=HEAD

all: prepare build

prepare:
	git archive -o docker-build/echoapp.tar HEAD

build:
	cp -p Dockerfile docker-build/Dockerfile
    # this tells docker to build the Dockerfile in the ./docker-build/ directory
    # and tag it so it shows up nicely under docker ps as:
    #
    #   victorlin/echoapp:<version>
    #
    # and if the docker build succeeds, remove all intermediate containers
    # more about this here: https://docs.docker.com/reference/commandline/cli/#build
	docker build -t $(NAME):$(VERSION) --rm docker-build
