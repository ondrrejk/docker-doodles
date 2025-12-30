# how to use
- docker build -t [container_name] [dir_path]
# use example
- docker build -t hello-container .
## Breakdown:
- docker build => build an image
- -t hello-container => give it a name (-t stands for tag)
- . => build context (current directory)
# Docker will:
1. Read your Dockerfile
2. Download the base image (python:3.11-slim)
3. Copy your file
4. Create a new image layer
5. Save the final image as "hello-container"
# Now run it
- docker run hello-container
- You should see:
    - Hello from inside a container!