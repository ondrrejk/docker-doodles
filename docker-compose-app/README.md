# how to use
docker build -t flask-webapp-optimized .
docker run -d -p 5000:5000 flask-webapp-optimized
- the multi stage image should be a lot smaller than normal docker image
# compage image sizes
- run the normal docker image version from the main branch to compare sizes
docker images | grep flask
