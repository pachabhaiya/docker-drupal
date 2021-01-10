FROM node:12-buster

ARG REACT_PROJECT_FOLDER
ENV REACT_PROJECT_FOLDER=${REACT_PROJECT_FOLDER}

WORKDIR /home/node/${REACT_PROJECT_FOLDER}

COPY ./www/${REACT_PROJECT_FOLDER}/package.json .
# RUN npm install --quiet
RUN yarn install

EXPOSE 8080

CMD ["node", "index.js"]