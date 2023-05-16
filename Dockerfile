FROM registry.access.redhat.com/ubi8/nodejs-18-minimal:1

WORKDIR /opt/app-root/src

COPY package.json /opt/app-root/src

RUN npm install --only=prod

COPY app.js /opt/app-root/src/server
COPY logger.js /opt/app-root/src/server
COPY public /opt/app-root/src/public

ENV NODE_ENV production
ENV PORT 8080

EXPOSE 8080

CMD ["npm", "start"]