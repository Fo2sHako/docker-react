FROM node:alpine as Builder
WORKDIR '/app/react'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=Builder /app/react/build /usr/share/nginx/html
