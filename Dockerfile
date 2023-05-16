FROM node:16-alpine

RUN addgroup app && adduser -S -G app app
RUN mkdir /app && chown app:app /app

USER app
WORKDIR /app

COPY --chown=app:app package.json package-lock.json* ./

RUN npm install

COPY --chown=app:app . .

EXPOSE 8080

CMD [ "npm", "start" ]