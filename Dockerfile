# Build stage
FROM node:16-alpine as build
WORKDIR /home/videosonik
COPY package.json yarn.lock .
RUN yarn
COPY . .
RUN yarn build:production

# Package stage
FROM nginx:stable-alpine
COPY --from=build /home/videosonik/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]