# Single Table Inheritance with Devise (Coba)

## What is Single Table Inheritance?
Single Table Inheritance (STI) is defined as multiple subclasses sharing a single database table. Rails supports STI right out of the box simply by inheriting subclasses from an ActiveRecord parent class which has a type column in its table.

(source: https://medium.com/@User3141592/when-to-use-single-table-inheritance-vs-multiple-table-inheritance-db7e9733ae2e)

Tutorial from: https://www.driftingruby.com/episodes/single-table-inheritance

## Prerequisite

1. Ruby 2.6.3
2. Rails 5.2.4
3. PostgreSQL 11.5

## Migration

Edit the migration like below

```
$ rails g migration add_type_to_users type:string
```

``ruby
# db/migrations/20200221021551_add_type_to_users.rb

# frozen_string_literal: true

class AddTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string
  end
end
```

## Models

**user.rb**
```ruby
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
```

**participant.rb**
```ruby
class Participant < User
end
```

**sponsor.rb***
```ruby
class Sponsor < User
end
```

## Routes

```ruby
# config/routes.rb

Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :participants
  devise_for :sponsors
  namespace :dashboard do
    root to: 'dashboard#index'
  end
end
```
