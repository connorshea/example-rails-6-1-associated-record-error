# README

This is an example repo for a Rails issue that I ran into when testing out an upgrade to 6.1.0.rc1 with my Rails app [vglist](https://github.com/connorshea/vglist).

You'll see that when you run `bundle exec rails db:seed`, it fails.

- Clone repo with `git clone https://github.com/connorshea/example-rails-6-1-associated-record-error`
- `bundle install`
- `bundle exec rails db:migrate` (will need Postgres)
- `bundle exec rails db:seed` to trigger the failure

If you switch to the `rails-6-0` branch, `bundle install` and re-run `bundle exec rails db:seed`, it won't fail.

Some change in Rails 6.1 has broken this and caused it to attempt to run invalid SQL.
