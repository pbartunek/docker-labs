FROM ruby:2.5-alpine

WORKDIR /app
ADD ./app /app

RUN bundle install
RUN adduser -h /app -s /bin/nologin -u 1337 -g 1337 -D sinatra
RUN chown sinatra: /app/votes.yml && chmod +w /app/votes.yml
RUN apk-install ruby-json

EXPOSE 8080
USER sinatra

ENV SESSION_SECRET=42793a0648d971a1e085431676cce431

CMD ["ruby", "app.rb"]
