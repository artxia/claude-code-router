FROM node:20-alpine

RUN mkdir -p /code/src /app
COPY ./claude-code-router/package*.json /code
COPY ./claude-code-router/src /code/src
RUN cd /code && ls && \
    npm i && \
    npm run build && \
    cp dist/* /app

WORKDIR /app

EXPOSE 3456

CMD ["node", "cli.js", "start"]
