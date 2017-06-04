# rails_erd (visual representation of your schema)


[tutorial](https://ryanboland.com/blog/creating-a-database-diagram-with-rails-erd/)

```ruby
# Gemfile
gem 'rails-erd'
```

```bash
# brew install graphviz # If you dont have graphviz installed.

bundle install
erd --inheritance --direct --attributes=foreign_keys,content
#=> Diagram saved to 'erd.pdf'.
```
