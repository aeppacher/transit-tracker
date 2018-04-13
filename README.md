# TransitTracker

We are all going to have different postgres users and password so I set up dev.exs to use env variables. We also don't want to commit our google auth stuff so that is configured with env variables as well. To get set up create a .env file at the root of the project with the following contents:

`export GOOGLE_CLIENT_ID=<google client id>
export GOOGLE_CLIENT_SECRET=<google client secret>
export DB_USER=<postgres user>
export DB_PASS=<postgres password>`

everytime you open a new terminal to work on this user the command `source .env` to inject the env variables

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
