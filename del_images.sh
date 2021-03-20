docker images -a
docker rmi $(docker images -a -q)
