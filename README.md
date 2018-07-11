# Etorus API

## Setup

- Install ruby version 2.5.0;
- `cp config/database.yml.example config/database.yml`;
- Edit `config/database.yml` with your database information;
- Create databases with `bundle exec rake db:create:all`
- `bundle exec rake db:migrate`


## Environment variables

Using `dotenv-rails` we just need to configure an `.env` file (e.g. `cp .env.example .env`) which will be loaded at runtime.
Bellow we have some value for the given variables:

```
FB_SECRET=a3f49382b25f48f89079068a356b50ea
FB_ID=986809631467739
APP_ID_PUSHER=529610
APP_KEY_PUSHER=8fe0e77a83286d9b5e14
SECRET_PUSHER=bf49e76834b5319edd0f
```

## Running tests

All you need is run RSpec command like `bundle exec rspec`.
