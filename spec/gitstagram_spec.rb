require 'spec_helper'

describe Gitstagram do

  describe "#saving_path" do
    it "should return path to the ./gitstagram folder" do
      user = File.expand_path("~").split('/').last
      home = Gitstagram.saving_path.should == "/Users/#{user}/.gitstagram"
    end
  end

  describe "#install" do
    it "should raise NotGitDirectoryError" do
      any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { false }
      end
      lambda {
        Gitstagram.install
      }.should raise_error(Gitstagram::NotGitDirectoryError)
    end

    it "should raise PostCommitAlreadyExistError" do
      any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { true }
        stub(gd).has_post_commit_hook? { true }
      end

      lambda { 
        Gitstagram.install
      }.should raise_error(Gitstagram::PostCommitAlreadyExistError)
    end

    it "should call #add_post_commit" do
      any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { true }
        stub(gd).has_post_commit_hook? { false }
        mock(gd).add_post_commit
      end

      Gitstagram.install
    end
  end

  describe "#uninstall" do
    it "should raise NotGitDirectoryError" do
      any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { false }
      end

      lambda {
        Gitstagram.uninstall
      }.should raise_error(Gitstagram::NotGitDirectoryError)
    end

    it "should raise NoPostCommitExistError" do
      any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { true }
        stub(gd).has_post_commit_hook? { false }
      end

      lambda {
        Gitstagram.uninstall
      }.should raise_error(Gitstagram::NoPostCommitExistError)
    end

    it "should call #delete_post_commit" do
        any_instance_of(Gitstagram::GitDir) do |gd|
        stub(gd).is_git_directory? { true }
        stub(gd).has_post_commit_hook? { true }
        mock(gd).delete_post_commit
      end

      Gitstagram.uninstall
    end
  end

end
