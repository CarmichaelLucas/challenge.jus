FROM ruby:3.0.2-alpine3.14

RUN apk add --no-cache --update \ 
            build-base \
            vim \
            nodejs \
            postgresql-dev \
            tzdata
            
RUN gem update --system \
    && gem install bundler

WORKDIR /var/www/api

COPY ./Gemfile .
COPY ./Gemfile.lock .

RUN bundle install

EXPOSE 3000
