[![Docker Pulls](https://img.shields.io/docker/pulls/madrussian/b3coin-docker.svg)](https://hub.docker.com/r/madrussian/b3coin-docker/)

# b3coin-docker
Run b3coin QT GUI in a docker

## Run

### Create necessary local directories
Before starting the docker container make sure to do the following the first time:
```
mkdir ~/.B3-CoinV2
```

This allows your local folder to have store the data for B3, including
most importantly the wallet.dat file.

### Starting
Run the following command to start the docker in daemon mode.

This will start the docker. All future interactions will use the name `b3-run`.
The files that the docker container will pull down will be in ~/.B3-CoinV2.

`sudo docker run -d --name b3-run -p 5999:5999 -v ~/.B3-CoinV2:/root/.B3-CoinV2 madrussian/b3coin-docker:latest `

### Stopping
To stop the container run the following commands:
`sudo docker stop b3-run; sudo docker rm b3-run;`

The removal is necessary if you are going to run the instance again.
If you attempt to run without removing the old container name it will fail to
start.

### Viewing the logs
`sudo docker logs b3-run`

### Access to shell
`sudo docker exec -it b3-run bash`

### Access to QT
`vncviewer localhost:5999`

## Build

This only needs to be done if you make changes to the files in this repository.

```
sudo docker build --build-arg MAKE_JOBS=4 -t madrussian/b3coin-docker:latest build/
```
