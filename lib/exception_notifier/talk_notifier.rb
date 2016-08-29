require 'faraday'

module ExceptionNotifier
  class TalkNotifier
    def initialize(options)
      @author_name = options[:author_name]
      @redirect_url = options[:redirect_url]
      @backtrace_depth = options[:backtrace_depth] || 10
      @hook_url = options[:hook_url]
    end

    def call(exception, options={})
      Faraday.post(@hook_url, {
          authorName: @author_name,
          title: "#{exception.class.name}: #{exception.message}",
          text: exception.backtrace.try(:[], 0, @backtrace_depth).try(:join, "\n")
      })
    end
  end
end
