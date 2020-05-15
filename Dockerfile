FROM node:alpine as builder

WORKDIR /usr/app/react-app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx
COPY --from=builder /usr/app/react-app/build /usr/share/nginx/html

