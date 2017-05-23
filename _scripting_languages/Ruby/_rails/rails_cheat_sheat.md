# Rails

###### Migration
```
rails g model ChatRoom title:string user:references
```

###### routes
```
```

###### ActiveRecord
```
user.friend_ids # get friend ids

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
