FROM node:16-alpine

RUN mkdir /app && chown node:node /app

WORKDIR /app

USER node
COPY --chown=node:node package.json package-lock.json* ./

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "npm", "start" ]