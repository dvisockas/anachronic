# Async::Methods

Simply execute your methods in a background process (ActiveJob, Sidekiq, etc...)

Instead of having to write a wrapper for every class, just add `async` before your method:

### Usual boilerplate case:
```ruby
class Human
  def speak
    puts('Truth!')
  end
end

class HumanJob < ApplicationJob
  def perform(human)
    human.speak
  end
end

HumanJob.perform_later(Human.new)
```

### You can now write:
```ruby
class Human
  async def speak
    puts('Truth!')
  end
end

Human.new.speak
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'async-methods'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install async-methods

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvisockas/async-methods. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dvisockas/async-methods/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Async::Methods project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dvisockas/async-methods/blob/master/CODE_OF_CONDUCT.md).
