FROM mhart/alpine-node:5.12

RUN mkdir /app

COPY . /app/

WORKDIR /app/

RUN ls /app/*

RUN apk update && \
    apk add curl && \
    npm install -g node-json2html

EXPOSE 8889

ENTRYPOINT ["node"]
CMD ["app.js"]

