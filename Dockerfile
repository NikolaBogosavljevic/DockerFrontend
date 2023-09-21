FROM node:18.15.0-alpine AS builder
WORKDIR /ueK223_Gruppe5_Frontend
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /ueK223_Gruppe5_Frontend/build .
COPY ./nginx.conf .
ENTRYPOINT ["nginx", "-g", "daemon off;"]
