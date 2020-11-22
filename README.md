# README

This is an example repo for a Rails issue that I ran into when testing out an upgrade to 6.1.0.rc1 with my Rails app [vglist](https://github.com/connorshea/vglist).

You'll see that when you run `bundle exec rails db:seed`, it fails.

- Clone repo with `git clone https://github.com/connorshea/example-rails-6-1-associated-record-error`
- `bundle install`
- `bundle exec rails db:migrate` (will need Postgres)
- `bundle exec rails db:seed` to trigger the failure

If you switch to the `rails-6-0` branch, `bundle install` and re-run `bundle exec rails db:seed`, it won't fail.

Some change in Rails 6.1 has broken this and caused it to attempt to run invalid SQL.

Log from running `db:seed`:

```
Connors-MacBook-Pro-2:example-rails-6-1-associated-record-error connorshea$ bundle exec rails db:seed --trace
** Invoke db:seed (first_time)
** Invoke db:load_config (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute db:load_config
** Execute db:seed
** Invoke db:abort_if_pending_migrations (first_time)
** Invoke db:load_config 
** Execute db:abort_if_pending_migrations
Creating Game Purchases...
rails aborted!
ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  missing FROM-clause entry for table "platforms"
LINE 1: ...hases" WHERE "game_purchases"."comments" = $1 AND "platforms...
                                                             ^
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:678:in `exec_params'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:678:in `block (2 levels) in exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/dependencies/interlock.rb:48:in `block in permit_concurrent_loads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/share_lock.rb:187:in `yield_shares'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/dependencies/interlock.rb:47:in `permit_concurrent_loads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:677:in `block in exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:697:in `block (2 levels) in log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:26:in `block (2 levels) in synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `handle_interrupt'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `block in synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `handle_interrupt'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:696:in `block in log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/notifications/instrumenter.rb:24:in `instrument'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:688:in `log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:676:in `exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:655:in `execute_and_clear'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql/database_statements.rb:53:in `exec_query'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/database_statements.rb:532:in `select'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/database_statements.rb:69:in `select_all'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/query_cache.rb:103:in `select_all'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/querying.rb:47:in `find_by_sql'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:850:in `block in exec_queries'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:868:in `skip_query_cache_if_necessary'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:835:in `exec_queries'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:638:in `load'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:249:in `records'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:524:in `find_take'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:98:in `take'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:81:in `find_by'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:175:in `find_or_create_by!'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/querying.rb:22:in `find_or_create_by!'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:24:in `block in <top (required)>'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:16:in `times'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:16:in `<top (required)>'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/engine.rb:567:in `load'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/engine.rb:567:in `load_seed'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/tasks/database_tasks.rb:449:in `load_seed'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/railties/databases.rake:386:in `block (2 levels) in <top (required)>'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `block in execute'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `each'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `execute'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:199:in `invoke_with_call_chain'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:188:in `invoke'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:160:in `invoke_task'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `each'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block in top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:125:in `run_with_threads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:110:in `top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:186:in `standard_exception_handling'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_module.rb:59:in `with_application'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/command.rb:52:in `invoke'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'

Caused by:
PG::UndefinedTable: ERROR:  missing FROM-clause entry for table "platforms"
LINE 1: ...hases" WHERE "game_purchases"."comments" = $1 AND "platforms...
                                                             ^
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:678:in `exec_params'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:678:in `block (2 levels) in exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/dependencies/interlock.rb:48:in `block in permit_concurrent_loads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/share_lock.rb:187:in `yield_shares'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/dependencies/interlock.rb:47:in `permit_concurrent_loads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:677:in `block in exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:697:in `block (2 levels) in log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:26:in `block (2 levels) in synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `handle_interrupt'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `block in synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `handle_interrupt'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:696:in `block in log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activesupport/lib/active_support/notifications/instrumenter.rb:24:in `instrument'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb:688:in `log'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:676:in `exec_no_cache'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:655:in `execute_and_clear'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/postgresql/database_statements.rb:53:in `exec_query'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/database_statements.rb:532:in `select'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/database_statements.rb:69:in `select_all'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/connection_adapters/abstract/query_cache.rb:103:in `select_all'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/querying.rb:47:in `find_by_sql'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:850:in `block in exec_queries'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:868:in `skip_query_cache_if_necessary'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:835:in `exec_queries'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:638:in `load'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:249:in `records'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:524:in `find_take'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:98:in `take'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation/finder_methods.rb:81:in `find_by'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/relation.rb:175:in `find_or_create_by!'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/querying.rb:22:in `find_or_create_by!'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:24:in `block in <top (required)>'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:16:in `times'
/Users/connorshea/Programming/example-rails-6-1-associated-record-error/db/seeds.rb:16:in `<top (required)>'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/engine.rb:567:in `load'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/engine.rb:567:in `load_seed'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/tasks/database_tasks.rb:449:in `load_seed'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/activerecord/lib/active_record/railties/databases.rake:386:in `block (2 levels) in <top (required)>'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `block in execute'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `each'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:281:in `execute'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:199:in `invoke_with_call_chain'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/task.rb:188:in `invoke'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:160:in `invoke_task'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `each'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:116:in `block in top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:125:in `run_with_threads'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:110:in `top_level'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/application.rb:186:in `standard_exception_handling'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rake-13.0.1/lib/rake/rake_module.rb:59:in `with_application'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/command.rb:52:in `invoke'
/Users/connorshea/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/bundler/gems/rails-413a02c4a5dc/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'
Tasks: TOP => db:seed
```

The code in `seeds.rb` triggering this error is this, where `platforms` is an array of `Platform` objects:

```ruby
GamePurchase.find_or_create_by!(
  comments: 'foo',
  platforms: platforms
)
```

And then the SQL being run on Rails 6.1 because of this code is:

```
# From adding `puts` statements inside `lib/active_record/connection_adapters/postgresql_adapter.rb` at the `exec_no_cache` method.
# SQL query on Rails 6.1:
"SELECT \"game_purchases\".* FROM \"game_purchases\" WHERE \"game_purchases\".\"comments\" = $1 AND \"platforms\".\"platform_id\" IN ($2, $3, $4) LIMIT $5"
# arguments:
["foo", 46, 24, 10, 1]
```

On Rails 6.0, these are the queries being run instead:

```
"SELECT 1 AS one FROM \"game_purchase_platforms\" WHERE \"game_purchase_platforms\".\"game_purchase_id\" IS NULL AND \"game_purchase_platforms\".\"platform_id\" = $1 LIMIT $2"
# arguments:
[23, 1]

"INSERT INTO \"game_purchases\" (\"comments\", \"created_at\", \"updated_at\") VALUES ($1, $2, $3) RETURNING \"id\""
# arguments:
["foo", "2020-11-22 01:28:53.908192", "2020-11-22 01:28:53.908192"]

"SELECT 1 AS one FROM \"game_purchase_platforms\" WHERE \"game_purchase_platforms\".\"game_purchase_id\" = $1 AND \"game_purchase_platforms\".\"platform_id\" = $2 LIMIT $3"
# arguments:
[20, 23, 1]

"INSERT INTO \"game_purchase_platforms\" (\"game_purchase_id\", \"platform_id\", \"created_at\", \"updated_at\") VALUES ($1, $2, $3, $4) RETURNING \"id\""
# arguments:
[20, 23, "2020-11-22 01:28:53.911865", "2020-11-22 01:28:53.911865"]
```
