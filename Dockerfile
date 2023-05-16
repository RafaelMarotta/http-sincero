FROM node:16-alpine

RUN mkdir /app && chown node:node /app
RUN chown -R 1001350000:0 "/.npm"

WORKDIR /app

USER node
COPY --chown=node:node package.json package-lock.json* ./

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "npm", "start" ]