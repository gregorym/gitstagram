require 'optparse'
require 'gitstagram'

module Gitstagram
  class CLI
    
    def run(args=ARGV)
      parse_options(args)
    end

    def parse_options(argv)
      opts = {}

      @parser = OptionParser.new do |o|       
        o.on "-i", "--install" do
          begin
            Gitstagram.install
          rescue NotGitDirectoryError
            puts "This directory is not a Git repository."
          rescue PostCommitAlreadyExistError
            puts "Cannot install Gitstagram, a post-commit already exists."
          end
        end

        o.on "-u", "--uninstall" do
          begin
            Gitstagram.uninstall
          rescue NotGitDirectoryError
            puts "This directory is not a Git directory."
          rescue NoPostCommitExistError
            puts "Gitstagram is not installed in this Git repository."
          end
        end
      end

      @parser.parse!(argv)
      opts
    end

  end
end