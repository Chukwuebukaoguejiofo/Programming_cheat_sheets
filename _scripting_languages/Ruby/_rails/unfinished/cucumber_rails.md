# cucumber

[Documentation](https://github.com/cucumber/cucumber-rails)

[Blog](https://semaphoreci.com/community/tutorials/introduction-to-writing-acceptance-tests-with-cucumber)


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



###### Step definitions
```ruby
# myApp/features/step_definitions/my_steps.rb

Given /^I have articles titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Article.create!(:title => title)
  end
end

Given /^I have no articles$/ do
  Article.delete_all
end

Then /^I should have ([0-9]+) articles?$/ do |count|
  Article.count.should == count.to_i
end
```



###### Support
```ruby
# myApp/features/support/my_support.rb

def path_to(page_name)
  case page_name

  when /the homepage/
    root_path
  when /the list of articles/
    articles_path

  # Add more page name => path mappings here

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end
```



###### The actual test
```gherkin
# myApp/features/my_test.feature

Feature: Manage Articles
  In order to make a blog
  As an author
  I want to create and manage articles

  Scenario: Articles List
    Given I have articles titled Pizza, Breadsticks
    When I go to the list of articles
    Then I should see "Pizza"
    And I should see "Breadsticks"

  Scenario: Create Valid Article
    Given I have no articles
    And I am on the list of articles
    When I follow "New Article"
    And I fill in "Title" with "Spuds"
    And I fill in "Content" with "Delicious potato wedges!"
    And I press "Create"
    Then I should see "New article created."
    And I should see "Spuds"
    And I should see "Delicious potato wedges!"
    And I should have 1 article
    
```






```bash
# run cucumber

# The -s option is to hide the steps definition location
[bundle exec] cucumber -s
```
