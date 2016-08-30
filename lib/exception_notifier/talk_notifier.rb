require 'faraday'
require 'socket'

module ExceptionNotifier
  class TalkNotifier
    include BacktraceCleaner

    def initialize(options)
      @author_name = options[:author_name] || Socket.gethostname
      @backtrace_depth = options[:backtrace_depth]
      @clean_backtrace = options[:clean_backtrace]
      @hook_url = options[:hook_url]
    end

    def call(exception, options={})
      Faraday.post(@hook_url, {
          authorName: @author_name,
          title: "#{exception.class.name}: #{exception.message}",
          text: stringify_exception(exception)
      })
    end

    def stringify_exception(e)
      if e.backtrace.present?
        backtrace = @clean_backtrace ? clean_backtrace(e) : e.backtrace
        backtrace = backtrace.first(@backtrace_depth) if @backtrace_depth
        ["#{e.class.name}: #{e.message}", 'Backtrace: ', backtrace].join("\n")
      else
        "#{e.class.name}: #{e.message}"
      end
    end
  end
end
