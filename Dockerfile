# Build stage
FROM node:16-alpine as build
WORKDIR /home/videosonik
COPY . .
RUN yarn install
RUN yarn build --prod

# Package stage
FROM nginx:stable-alpine
COPY --from=build /home/videosonik/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]