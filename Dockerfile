# syntax=docker/dockerfile:1

FROM node:16

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*"]

RUN rm -rf ./.npm-cache || true
RUN mkdir -p ./.npm-cache || true
RUN npm cache clean -f
RUN export npm_config_cache=./.npm-cache 

COPY . .

CMD ["npm", "start"]