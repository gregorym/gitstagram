module Gitstagram
  class GitDir < Dir

    def initialize(path)
      @path = path
    end

    #
    # Returns true if the current directory is a git directory.
    ## Check the presence of .git in the folder
    #
    def is_git_directory?
      Dir.entries('.').include? '.git'
    end
    alias_method :is_git_dir?, :is_git_directory?


    #
    # Returns true if the git directory already has a post-commit hook.
    #
    def has_post_commit_hook?
      Dir.entries('.git/hooks').include? 'post-commit'
    end

    #
    # Remove post-commit file from .git/hooks
    #
    def delete_post_commit
      file_path = @path + '/.git/hooks/post-commit'
      if File.exists? file_path
        File.delete file_path
      end
    end

    def add_post_commit
      File.open('./.git/hooks/post-commit', 'w', 0755) {|f| f.write("#!/bin/sh\ngitstagram --snapshot") }
    end
  end
end

if RUBY_VERSION =~ /^1\.8/
  class Dir
    class << self 
      def exists? (path)
        File.directory?(path)
      end
      alias_method :exist?, :exists?
    end
  end
end