require 'gitstagram/version'
require 'gitstagram/system_caller'
require 'gitstagram/git_dir'
require 'gitstagram/snapshot'

module Gitstagram
  class << self

    #
    # Returns the absolute path of the tools folder
    #
    def tools_path
      File.expand_path('../tools', File.dirname(__FILE__))
    end

    #
    # Returns the absolute path to the home directory
    #
    def home_path
      File.expand_path("~")
    end

    #
    # Returns the path to where images are saved.
    #
    def saving_path
      path = home_path + '/.gitstagram'
    
      Dir.mkdir(path) unless Dir.exists?(path)
      path
    end

  end
end