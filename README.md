## Twilio Test

Very simple starter app for a hackathon tonight. This just allows you to send text-messages via Twilio.

To use:

git clone https://github.com/wiseleyb/twilio-test

cd twilio-test

bundle

bundle exec rake db:migrate
bundle exec rake db:test:prepare

### Sidekiq

brew install redis

Then start redis

redis-server

bundle exec sidekiq

### Rails server
Then start rails

bundle exec rails s

Got to http://localhost:3000

### Sidekiq stats page

http://localhost:3000/sidekiq

### Testing

Run all cucumber tests

```
bundle exec rake

or

bundle exec cucumber
```
