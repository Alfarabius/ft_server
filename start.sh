docker build -t my_server .
docker run -it --rm -p 80:80 -p 443:443 my_server
docker rm $(docker ps -a -f status=exited -q)
