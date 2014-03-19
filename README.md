# Capistrano::Bower [![Gem Version](https://badge.fury.io/rb/capistrano-bower.png)](http://badge.fury.io/rb/capistrano-bower)

Bower for support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-bower'
gem 'capistrano'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-bower

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/bower'
```

The task will run before `deploy:updated` as part of Capistrano's default deploy,
or can be run in isolation with `cap production bower:install`

Configurable options, shown here with defaults:

```ruby
set :bower_flags, '--quiet --config.interactive=false'
set :bower_roles, :web
set :bower_target_path, nil
```

If your bower.json is not in the root directory, set the directory with :bower_target_path. For example with Symfony2:

```ruby
set :bower_flags, '--quiet --config.interactive=false'
set :bower_roles, :web
set :bower_target_path, "#{release_path}/web"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
