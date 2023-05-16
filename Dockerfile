# syntax=docker/dockerfile:1

FROM node:16

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm cache clean --force
RUN npm install --production

COPY . .

CMD ["npm", "start"]