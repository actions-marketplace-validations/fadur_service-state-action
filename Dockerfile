FROM alpine:3.14

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

RUN apk add jq 


WORKDIR /var/task
COPY ./entrypoint.sh /var/task/entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]

