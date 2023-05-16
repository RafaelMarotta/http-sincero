# syntax=docker/dockerfile:1

FROM registry.access.redhat.com/ubi8/nodejs-18

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "logger.js", "bin/www", "./"]

RUN rm -rf ./.npm-cache || true
RUN mkdir -p ./.npm-cache || true
RUN npm cache clean -f
RUN export npm_config_cache=./.npm-cache 
RUN npm install

COPY . .

CMD ["node", "."]