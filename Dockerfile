# Build stage
FROM node:16-alpine as build
WORKDIR /home/videosonik
COPY package.json yarn.lock ./
RUN yarn install

COPY . ./
RUN yarn build --prod

# Package stage
FROM nginx:stable-alpine
COPY --from=build /home/videosonik/build /usr/share/nginx/html
COPY --from=build /home/videosonik/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]