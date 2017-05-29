# Sidekiq tutorial

[Sidekiq github](https://github.com/mperham/sidekiq)


```bash
rails new SidekiqApp
cd SidekiqApp
rails g scaffold user name email address
rails db:migrate
```


```ruby
gem 'sidekiq'

```

```bash
bundle install
```


```ruby
# application.rb

config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async

```


```ruby
# config/initializers/sidekiq.rb


Sidekiq.configure_server do |config|
    config.redis = {url: 'redis://localhost:6379/0'}
end

Sidekiq.configure_client do |config|
    config.redis = {url: 'redis://localhost:6379/0'}
end

```

```bash
rails g job generate_random_user
```


```ruby
# controller
 GenerateRandomUserJob.perform_later
 # a best practice is to pass the ID, not the entire object
 # jobs can fail and be run over and over, so make sure your code can run multiple times
 # dont make jobs dependent on other jobs
 # jobs are concurrent
 # use redis as a persistent store, not as a cache
 # you can have 2 instances of Redis, one as a cache, another as a persistent store for sidekiq

```



```bash
sidekiq
# start redis also
```




```ruby
# routes.rb

require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'  # check how to wrap this with devise gem

```



```

http://localhost:3000/sedikiq
```

