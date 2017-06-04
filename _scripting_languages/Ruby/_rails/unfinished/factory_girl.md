# FactoryGirl

[documentation](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#configure-your-test-suite)



```ruby
# rails_helper.rb

config.include FactoryGirl::Syntax::Methods

```


###### create the folder for the factories
```
myApp/spec/factories/
```

```ruby
# myApp/spec/factories/users.rb (user factory)
FactoryGirl.define do
  factory :user do # This will guess the User class
    name "brian"
    email "brian@example.com"
    address "123 foobar st"
    # add_attribute(:date_of_birth){'10.16.1988'} # another syntax
  end
end
```


```ruby
# in your tests
user = FactoryGirl.create(:user, name: "brian", email: "brian@example.com")
```
