require 'optparse'
require 'sidekiq'

module Gitstagram
  class CLI
    
    def parse(args=ARGV)
      options = parse_options(args)
      puts options
    end

    def run
      puts 'RUN'
    end

    def parse_options(argv)
      opts = {}

      @parser = OptionParser.new do |o|        
        o.on "-v", "--verbose", "Print more verbose output" do
          Sidekiq.logger.level = ::Logger::DEBUG
        end
      end

      @parser.parse!(argv)
      opts
    end

  end
end