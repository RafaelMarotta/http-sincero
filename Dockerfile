# syntax=docker/dockerfile:1

FROM registry.access.redhat.com/ubi8/nodejs-18

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD ["node", "."]