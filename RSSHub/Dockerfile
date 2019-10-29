FROM node:slim

ADD https://github.com/ubiquiti/docker-compose-aarch64/raw/70b56a86080322752120b1b5c57e947e371c1dbb/vendor/qemu-bin/qemu-aarch64-static /usr/bin

RUN chmod +x /usr/bin/qemu-aarch64-static

RUN echo -e "deb http://mirrors.ustc.edu.cn/debian/ stretch main \ndeb http://mirrors.ustc.edu.cn/debian/ stretch-updates main " > /etc/apt/sources.list

ADD https://github.com/ecliptik/dockerfiles/raw/8f1622cf7dff2ad85348238cdaad739b7ff8283a/fluentd/dumb-init  /usr/local/bin/dumb-init

RUN chmod +x /usr/local/bin/dumb-init

ARG USE_CHINA_NPM_REGISTRY=1;
ENV NODE_ENV production

WORKDIR /app

ADD https://github.com/DIYgod/RSSHub/raw/master/package.json /app

RUN if [ "$USE_CHINA_NPM_REGISTRY" = 1 ]; then \
  echo 'use npm mirror'; npm config set registry https://registry.npm.taobao.org; \
  fi;

RUN export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
		&& npm install --production

COPY . /app

EXPOSE 1200
ENTRYPOINT ["dumb-init", "--"]
CMD ["npm", "run", "start"]