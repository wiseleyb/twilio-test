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

Create a config/database.yml

```
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000
```

bundle
bundle exec rails s

Got to http://localhost:3000
