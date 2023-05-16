FROM node:16-alpine

RUN addgroup app && adduser -S -G app app
RUN mkdir /app && chown node:node /app

USER app
WORKDIR /app

COPY --chown=node:node package.json package-lock.json* ./

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "npm", "start" ]