# cucumber

[Documentation](https://github.com/cucumber/cucumber-rails)


require 'capybara/cucumber'

```ruby
# Gemfile
group :test do
  # we need the :require => false, so rails does snot complain
  gem 'cucumber-rails', :require => false
end
```



```bash
#     create  config/cucumber.yml
#     create  script/cucumber
#      chmod  script/cucumber
#     create  features/step_definitions
#     create  features/step_definitions/.gitkeep
#     create  features/support
#     create  features/support/env.rb
#      exist  lib/tasks
#     create  lib/tasks/cucumber.rake
#       gsub  config/database.yml
#       gsub  config/database.yml
#      force  config/database.yml
rails generate cucumber:install
```

```bash
# run cucumber

[bundle exec] cucumber
```
