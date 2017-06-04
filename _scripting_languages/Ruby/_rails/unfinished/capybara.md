# Capybara

[documentation](https://github.com/thoughtbot/capybara-webkit)


```ruby
# Gemfile
group :development, :test do
  gem "capybara-webkit"
end
```

```ruby
# rails_helper.rb
require 'capybara/rspec'
Capybara.javascript_driver = :webkit # in rails_helper.rb ???

RSpec.configure do |config|
  config.include Capybara::DSL
end
```



```ruby
# test  (not working yet)

# myApp/spec/requests/users_spec.rb

RSpec.describe "home page", :type => :request do
  it "displays the user's username after successful login" do
    user = FactoryGirl.create(:user, :name => "jdoe", :email => "secret")
    visit "/users/new"
    fill_in "Name", :with => ""
    fill_in "Email", :with => "brian@example.com"
    fill_in "Address", :with => "123 foobar st"
    click_button "Create User"
    expect(page).to have_selector("#error_explanation", text: "Name can't be blank")
  end
end
```
