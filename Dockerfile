# Use a existing docker image as a base
FROM node:alpine as builder
#work dir on container
WORKDIR '/app'
# Copy only package.json to minimize cache busting and rebuilds
COPY package.json .
# Download and install dependency
RUN npm install
#Copy all files
COPY . .
#build app
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#docker build -t matheus06/reactapp .
#docker run -p 8080:80 matheus06/reactapp

