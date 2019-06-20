FROM node:8-alpine
COPY . .
RUN npm ci --only=production
ENTRYPOINT [ "npm", "run", "start" ]