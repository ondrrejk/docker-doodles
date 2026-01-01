# list docker netws
docker network ls
# create docker network
docker network create mynet
docker run -d --name c1 --network mynet alpine sleep 1000
docker run -it --name c2 --network mynet alpine sh
# now im inside c2
ping c1
# inspect netws
docker network inspect mynet
# volumes
docker volume create mydata # named vol, managed by docker
docker run -v /home/ondrej/data:/data ... # bind mount (host -> container)
# try named vol
docker run -d \
  --name pg \
  -e POSTGRES_PASSWORD=pass \
  -v pgdata:/var/lib/postgresql/data \
  postgres:15
docker rm -f pg # delete the vol
docker run -d \
  --name pg \
  -e POSTGRES_PASSWORD=pass \
  -v pgdata:/var/lib/postgresql/data \
  postgres:15
# data is still there ;)

# scaling services w compose
docker compose up --scale web=3 # horizontal scaling (kubernetessssss)
# advanced compose
## docker-compose.yml ##
services:
  proxy:
    image: nginx
    ports:
      - "80:80"
    depends_on:
      - web
# debug containers
docker logs <container> # check logs
docker exec -it <container> sh # enter a running cont
docker exec <container> env # check env vars
docker exec <container> netstat -tulpn # check open ports
docker exec <container> ping db # check dns resolution