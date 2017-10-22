# Has Many Through

```ruby
# Use this:
# rails g scaffold User name
# rails g scaffold Subject name
# rails g model SubjectUser subject:references user:references

class User < ApplicationRecord
  has_many :subject_user
  has_many :subjects, through: :subject_user
end

class SubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :subject
end

class Subject < ApplicationRecord
  has_many :subject_user
  has_many :users, through: :subject_user
end

u.create(name: "brian")
u = User.first
u.subjects
s = Subject.create(name: "math")
u.subjects = [s]
s.users
```
