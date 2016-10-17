FROM alpine:edge

MAINTAINER Andrey Sorokin "masterandrey@gmail.com"

RUN apk add --no-cache nodejs git python make && \ 
		mkdir -p /var/www && \
		npm install -g express-generator bower mocha sinon should assert grunt-cli gulp node-gyp nodemon
RUN git clone https://github.com/KhaosT/HAP-NodeJS.git
RUN cd HAP-NodeJS/
RUN npm install node-persist
RUN npm install srp
RUN npm install mdns --unsafe-perm
RUN npm install debug
RUN npm install ed25519 --unsafe-perm
RUN npm install curve25519 --unsafe-perm
RUN npm install mqtt --unsafe-perm
RUN apk del make gcc g++ python && \
		rm -rf /tmp/* /var/cache/apk/* && \
		rm -rf /root/.npm /root/.node-gyp ; \
