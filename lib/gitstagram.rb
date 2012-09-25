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

  end
end