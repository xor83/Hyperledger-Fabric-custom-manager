#!/bin/bash
echo "Hyperledger Fabric custom manager"

start_fabric() {
    
    echo "Starting all docker containers"
    docker ps -q -a | xargs docker start
    echo
    echo 'BNA container may still show up as dangling/exited - First command will start BNA'
    echo 'Hyperledger Fabric environment started ... done'
    
}

stop_fabric() {
    cd ./fabric-scripts/hlfv11/composer
    docker-compose stop
    echo
    echo 'Hyperledger Fabric environment stopped ... done'
}

case $1 in 
    start)
        start_fabric
        ;;
    stop)
        stop_fabric
        ;;
    *)
        echo 'Usage: ./fabricUtil start | stop'
esac