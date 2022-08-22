FROM node:14.15.1 as ubild

ARG GITHUB_TOKEN

WORKDIR /usr/src/app

COPY . .
RUN echo "//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}" >> .npmrc \
  && yarn install

FROM node:14.15.1

ENV TZ=Amirica/Toronto

ENV PORT=8081

COPY --from=build /usr/src/app /usr/src/app

WORKDIR /usr/src/app

CMD ["yarn", "start"]