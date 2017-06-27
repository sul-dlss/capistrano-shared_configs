# Capistrano::SharedConfigs

This gem provides capistrano tasks to pull the latest configs from the shared configs branch and update the symlinks in the shared directory.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-shared_configs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-shared_configs

## Usage

The tasks can be made available to your capistrano deploy environments by
requiring `capistrano/shared_configs` in your `Capfile`.

The tasks available are:

```
cap shared_configs:check     # Checks the project is ready to work with the shared configs directory
cap shared_configs:clone     # Clone the configs repo:branch; env values are optional: CONFIGS_REPO={repo} CONFIGS_BRANCH={branch}
cap shared_configs:pull      # Pulls the latest from the shared configs directory
cap shared_configs:symlink   # Symlinks the shared configs directory into the capistrano shared directory
cap shared_configs:update    # Pull the latest from the shared configs directory and symlink the files
```

`cap shared_configs:clone` can use optional environment variables, i.e.
- `CONFIGS_REPO={repo}`     : defaults to ssh://git@github.com/sul-dlss/shared_configs.git
- `CONFIGS_BRANCH={branch}` : defaults to "#{fetch(:application)}_#{fetch(:stage)}"

For example, to get started using the defaults:
```bash
cap {stage} shared_configs:clone
cap {stage} shared_configs:check
cap {stage} shared_configs:symlink
```

To override the default clone options:
```bash
cap {stage} shared_configs:clone \
  CONFIGS_REPO=https://{yourUserID}:{yourPasswd}@github.com/sul-dlss/shared_configs.git \
  CONFIGS_BRANCH=app_name_test_branch

cap {stage} shared_configs:check
cap {stage} shared_configs:symlink
```

These tasks can be added into your deployment workflow to automatically pull and symlink shared
configs into your capistrano shared directories, or alternatively just run manually from
the command line.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jkeck/capistrano-shared_configs.


## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/apache-2.0).
