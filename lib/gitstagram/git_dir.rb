module Gitstagram
  class GitDir < Dir

    #
    # Returns true if the current directory is a git directory.
    ## Check the presence of .git in the folder
    #
    def is_git_directory?
      Dir.glob('.git').include? '.git'
    end
    alias_method :is_git_dir?, :is_git_directory?


    #
    # Returns true if the git directory already has a post-commit hook.
    #
    def has_post_commit_hook?
      Dir.glob('.git/hooks/*').include? '.git/hooks/post-commit'
    end

    #
    # Remove post-commit file from .git/hooks
    #
    def delete_post_commit
      file_path = path + '/.git/hooks/post-commit'
      if File.exists? file_path
        File.delete file_path
      end
    end

    def add_post_commit
      file = File.open(File.expand_path('post-commit', File.dirname(__FILE__)), 'r') { |f| f.read }
      file.sub!('*||*') do |s|
        File.expand_path('../gitstagram.rb', File.dirname(__FILE__))
      end

      File.open('./.git/hooks/post-commit', 'w', 0755) {|f| f.write(file) }
    end
  end
end