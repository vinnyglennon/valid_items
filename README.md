Valid Items
=================

Goes through all your Rails ActiveRecord objects and check if they are all still pass your model validations. You may have added new validations to your model since creating your object, or ran update_column in your console to solve a production issue.
Inspired by a RailsConf talk by Ryan Laughlin and his talk at http://www.rofreg.com/talks/railsconf2018'


Installation
------------
**ValidItem**'s installation is pretty standard:

```sh
$ gem install valid_items
```

If you'd rather install **ValidItem** using `bundler`, don't require it in your `Gemfile`:

```rb
gem 'valid_items', require: false
```


Example usage
-------------

```ruby
require 'valid_items'
ValidItems.checkup
 => User id 203: {:name=>["can't be blank"]}
```

```ruby
require 'valid_items'
ValidItems.checkup(email: 'example@example.com')
 => User id 203: {:name=>["can't be blank"]}  
# and an email gets sent
```

```ruby
require 'valid_items'
ValidItems.checkup(updated_at: 1.day.ago)
 => 'ok'
```


```
Arguments:
 email: (String)
 updated_at: (ActiveSupport::TimeWithZone)
```

Running in development
----------------------
Eager Load is required on development, so that valid_items can query all AR models
```
Rails.application.eager_load!
```
You must have upgraded your Rails app so that all your models inherit from ApplicationRecord rather than ActiveRecord::Base.
