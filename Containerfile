FROM alpine:edge
RUN apk add git
RUN git clone https://github.com/vector-im/element-web
WORKDIR /element-web
RUN cp config.sample.json config.json
RUN apk add nodejs yarn
RUN yarn install
RUN sed -E 's/webpack-dev-server/webpack-dev-server --host 0\.0\.0\.0/g' package.json > package.new.json
RUN mv package.new.json package.json
ENTRYPOINT ["yarn", "run", "start"]
