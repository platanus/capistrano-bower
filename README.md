# Capistrano::Bower [![Gem Version](https://badge.fury.io/rb/capistrano-bower.png)](http://badge.fury.io/rb/capistrano-bower)

Bower for support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-bower'
    gem 'capistrano', github: 'capistrano/capistrano', branch: 'v3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-bower

## Usage

Require in `Capfile` to use the default task:

    require 'capistrano/bower'

The task will run before `deploy:updated` as part of Capistrano's default deploy,
or can be run in isolation with `cap production bower:install`

Configurable options, shown here with defaults:

    set :bower_dir, -> { (shared_path.relative_path_from release_path).join((JSON.parse(File.read(".bowerrc")) rescue {}).fetch("directory", "bower_components")) }
    set :bower_cwd, -> { release_path }
    set :bower_flags, '--quiet'
    set :bower_roles, :all

NOTE: bower doesn't support installing packages to an absoulte path. When the directory property is used, it's always relative to the cwd property. That's why in the default value I had to use the `relative_path_from` method from the release path.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
