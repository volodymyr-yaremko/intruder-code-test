FROM node:16.13.0-alpine3.11

COPY package.json /srv/package.json
COPY package-lock.json /srv/package-lock.json
COPY postcss.config.json /srv/postcss.config.json
COPY tailwind.config.json /srv/tailwind.config.json

COPY ./public /srv/public
COPY ./src /srv/src

WORKDIR /srv

RUN npm ci

ENTRYPOINT npm run serve