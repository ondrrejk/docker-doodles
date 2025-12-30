FROM python:3.11-slim
# installs lightweight version of python image
COPY app.py /app.py
# just like cp in bash => This copies your local file into the image’s filesystem, inside the container, /app.py will exist.
CMD ["python", "/app.py"]
# This tells Docker: “When someone runs a container from this image, execute this command.”
# use python interpreter to run app.py in local root folder