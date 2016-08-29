# Talk::Notifier

Notify exceptions using Talk.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'talk-notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install talk-notifier

## Usage

Add following lines to your `exception-notification` configurations.

```ruby
  Rails.application.config.middleware.use ExceptionNotification::Rack,
                                          :talk => {
                                              author_name: 'something you like', # message author name
                                              hook_url: 'your hook url', # your hook url
                                              backtrace_depth: 10, # (optional) backtrace depth you want, default 10
                                          }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FlyingBlazer/talk-notifier.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

