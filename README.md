# ExceptionNotifier::TalkNotifier

Notify exceptions using [Talk](http://jianliao.com).

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
  Rails.application.config.middleware.use(
      ExceptionNotification::Rack,
      :talk => {
          hook_url: 'your hook url',         # your webhook url
          author_name: 'something you like', # (optional) author name, default hostname
          backtrace_depth: 10,               # (optional) backtrace depth you want, nil if you want full backtrace, default nil
          clean_backtrace: false,            # (optional) whether or not to clean backtrace using Rails::BacktraceCleaner, default false
      }
  )
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FlyingBlazer/talk-notifier.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

