FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html




# Instead of this:

# FROM node:alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# COPY --from=builder /app/build /usr/share/nginx/html
# Do this:

# FROM node:alpine
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# COPY --from=0 /app/build /usr/share/nginx/html