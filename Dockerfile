FROM registry.access.redhat.com/ubi8/nodejs-18-minimal:1

WORKDIR /opt/app-root/src

COPY package.json /opt/app-root/src

RUN npm install --only=prod

COPY server /opt/app-root/src/server
COPY public /opt/app-root/src/public
COPY bin/www /opt/app-root/src/bin/www

ENV NODE_ENV production
ENV PORT 8080

EXPOSE 8080

CMD ["npm", "start"]