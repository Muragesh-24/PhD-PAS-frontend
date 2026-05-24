FROM node:16-alpine

ENV PORT=80

WORKDIR /home/ras

COPY package.json package-lock.json ./
RUN npm ci --include=dev

COPY . .

RUN npm run build

ENV NODE_ENV=production

EXPOSE 80

CMD ["npm", "run", "start"]
