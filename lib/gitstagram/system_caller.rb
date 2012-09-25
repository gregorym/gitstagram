module Gitstagram
  class SystemCaller
    class << self
      def call(command)
        system command
      end
    end
  end
end