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
