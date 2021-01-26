#Pulling the alpine image
FROM python:3.6-alpine
MAINTAINER : CHANIKYA MERUGU

# Creating  application  directory
WORKDIR /app

# Installing  application  dependencies
COPY src/requirements.txt ./

#Installing requirements for the application
RUN pip install -r requirements.txt

#Copying  app bundle source
COPY . /app

#app will be working on 7894 port
EXPOSE 7894

#putting WSGi server to make it more scalable and secure
CMD ["gunicorn", "--config", "/app/src/conf/gunicorn_config.py", "src.server:app"]
