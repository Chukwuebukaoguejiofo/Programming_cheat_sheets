# Rails

###### Generators
```bash
rails g model ChatRoom title:string user:references

#
# Add user_name to users table and also add an index on that column
#
rails g migration AddUserNameToUsers user_name:string:index

rails g migration RemoveUserNameFromUsers user_name:string  # string, decimal, references, text
```

###### Controllers
```ruby
# make this method available to the view.
helper_method :some_method_in_the_controller
```

###### routes
```
```

###### ActiveRecord
```
user.friend_ids # get friend ids
```

```
class User < ApplicationRecord
    self.table_name = "dudes"
    self.primary_key = 'dude_pk'
end
```

```
.joins will just joins the tables and brings selected fields in return. if you call associations on joins query result, it will fire database queries again

:includes will eager load the included associations and add them in memory. :includes loads all the included tables attributes. If you call associations on include query result, it will not fire any queries
```

###### Forms
```erb
<!-- checkboxes -->
<%= hidden_field_tag "product[categoryids][]", nil %>
<% Category.all.each do |category| %>
    <%= check_box_tag "product[categoryids][]", category.id, @products.category_ids.include?(category.id), id: dom_id(category) %>
    <%= label_tag dom_id(category), category.name %>
<% end %>
```

###### Did you know?
```
files in the 'app' folder are auto-loaded!
```
