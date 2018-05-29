# Bioq

## Pre-requisites

  * Install [Phoenix Framework](https://hexdocs.pm/phoenix/installation.html), which requires Elixir (which depends on Erlang), Node.js, PostgreSQL.
  * Configure your PostgreSQL database to make sure the user used by `Bioq` has `createdb` permission.

## To run the Bioq server

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `PORT=4012 mix phx.server`

Now you can visit [`localhost:4012`](http://localhost:4012) from your browser.

## Learn more

  * Deployment guide: http://www.phoenixframework.org/docs/deployment.
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
