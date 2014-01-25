## Twilio Test

Very simple starter app for a hackathon tonight. This just allows you to send text-messages via Twilio.

To use:

git clone https://github.com/wiseleyb/twilio-test

cd twilio-test

Create a config/twilio.yml file and enter your twilio info

```
development:
  account_sid:   ''
  auth_token:    ''
  phone_number:  '+14151231234'
test:

production:
```

bundle
bundle exec rails s

Got to http://localhost:3000


### Testing

Run all cucumber tests

```
bundle exec rake
```
