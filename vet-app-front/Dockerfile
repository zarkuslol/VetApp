# FRONT-END

# Use uma imagem base do Node.js
FROM node:20-alpine3.17 AS builder_front

USER root
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
WORKDIR /home/node
COPY package.json package.json

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN npm install --omit=dev
COPY . .

RUN rm -rf /home/node/.next/cache

RUN chown -R node:node /home/node/

# Executar o build do Next.js
USER node
RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "start" ]
