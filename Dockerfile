FROM ruby:3.1.2 as builder

COPY Gemfile Gemfile
RUN bundle install

FROM ruby:3.1.2 as image

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY . /opt/app/
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /Gemfile.lock /opt/app/Gemfile.lock

RUN gem install foreman
CMD foreman start -f Procfile.dev
