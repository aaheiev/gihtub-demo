# docker build -t github-demo:latest .
FROM nginx:1-alpine

ARG assembly_version=0.0.0.0
ARG http_port=80
ARG branch_name='undefined'
ARG commit_id=''

ENV BRANCH_NAME      $branch_name
ENV ASSEMBLY_VERSION $assembly_version
ENV COMMIT_ID        $commit_id
ENV HTTP_PORT        $http_port
ENV HEALTHCHECK_URL  "http://127.0.0.1:${http_port}/health"

#WORKDIR /app
COPY ./app/ /usr/share/nginx/html

#RUN addgroup app && adduser -D -G app app
#RUN apk add --no-cache curl nodejs npm postgresql-libs
#RUN apk add --no-cache --virtual=.build-deps git openssh-client build-base postgresql-dev
#
##Installing bundler without versioning could break things.
#RUN  npm install --global yarn
#
#RUN  gem install bundler \
#  && bundle install \
#  && bundle exec rake assets:precompile
#
#RUN apk del .build-deps
#
#RUN chown -R app:app /app
#
#EXPOSE 3000
#
#USER app
#
#CMD ["puma", "-C", "config/puma.rb"]
#
#HEALTHCHECK --interval=60s --timeout=5s --retries=12 CMD curl --silent --fail $HEALTHCHECK_URL || exit 1
