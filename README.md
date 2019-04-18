# lastpass-cli

## build
This will build the image from the Dockerfile.
```
docker build -t lastpass-cli .
```

## run locally
This will run the local image built using the commmand above.
```
docker run --rm -it \
           --name lastpass-cli \
           lastpass-cli:latest $*
```

## run
This will pull and run the container image built by [dockerhub](https://hub.docker.com/r/gocho/lastpass-cli).
```
docker run --rm -it \
           --name lastpass-cli \
           cagiti/lastpass-cli:latest $*
```
## lpass script
```
./lpass --version
```
