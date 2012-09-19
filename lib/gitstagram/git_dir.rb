module Gitstagram
  class GitDir < Dir

    #
    # Returns true if the current directory is a git directory.
    ## Check the presence of .git in the folder
    #
    def is_git_directory?
      Dir.glob.include? '.git'
    end
    alias_method :is_git_dir?, :is_git_directory?


    #
    # Returns true if the git directory already has a post-commit hook.
    #
    def has_post_commit_hook?
      Dir.glob('./.git/hooks/*').include? 'post-commit'
    end

  end
end