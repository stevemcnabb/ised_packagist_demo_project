FROM alpine
RUN apk add --no-cache python3 py3-pip
RUN pip3 install docker-compose

