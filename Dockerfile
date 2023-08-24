FROM ubuntu:jammy

RUN apt update
RUN apt install -y nodejs npm

WORKDIR /usr/app

RUN npm install left-pad

ARG key

ENV PROVKEY=$key

COPY <<EOF /usr/app/code.js
const leftPad = require('left-pad')

console.log(leftPad('hello cross demo', 5))
EOF

CMD ["node", "code.js"]
