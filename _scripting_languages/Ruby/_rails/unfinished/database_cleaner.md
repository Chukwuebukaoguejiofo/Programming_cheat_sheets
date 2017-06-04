# DatabaseCleaner

[Documentation](https://github.com/DatabaseCleaner/database_cleaner)


```ruby
# Gemfile
  gem 'database_cleaner'
```


```ruby
# rails_helper.rb
require 'database_cleaner' # dont do it from rspec_helper.rb


RSpec.configure do |config|
  config.use_transactional_fixtures = false
    
    
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
end
```



  
  
  
  
  
  
  
  
  
