# Rails

###### Migration
```
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
<%= hidden_field_tag "product[categoryids][]", nil %>
<% Category.all.each do |category| %>
    <%= check_box_tag "product[categoryids][]", category.id, @products.category_ids.include?(category.id) %>
    <%= category.name %>
<% end %>
```
