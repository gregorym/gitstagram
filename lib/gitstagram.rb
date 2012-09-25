require 'gitstagram/version'
require 'gitstagram/errors'
require 'gitstagram/system_caller'
require 'gitstagram/git_dir'
require 'gitstagram/snapshot'
require 'gitstagram/movie_maker'

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

    #
    # Install the post-commit hook
    #
    def install
      git_dir = GitDir.new(File.expand_path("."))
      raise NotGitDirectoryError        unless git_dir.is_git_directory?
      raise PostCommitAlreadyExistError if git_dir.has_post_commit_hook?

      git_dir.add_post_commit
      puts 'Gitstagram properly installed.'
    end

    #
    # Remove the post-commit hook
    # 
    def uninstall
      git_dir = GitDir.new(File.expand_path("."))
      raise NotGitDirectoryError        unless git_dir.is_git_directory?
      raise NoPostCommitExistError      unless git_dir.has_post_commit_hook?

      git_dir.delete_post_commit
      puts 'Gitstagram properly uninstalled from this Git repository.'
    end

  end
end