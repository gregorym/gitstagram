module Gitstagram
  class NotGitDirectoryError < StandardError; end;
  class PostCommitAlreadyExistError < StandardError; end;
  class NoPostCommitExistError < StandardError; end;
end