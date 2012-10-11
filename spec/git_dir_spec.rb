require 'spec_helper'

describe Gitstagram::GitDir do
  before do
    @dir = Gitstagram::GitDir.new('.')
  end

  describe "#is_git_directory?" do
    context 'folder contains a .git directory' do
      before do
        stub(Dir).entries { ['.git'] }
      end

      it 'should return true' do
        @dir.is_git_dir?.should be_true
      end
    end

    context 'folder does not contain a .git directory' do
      before do
        stub(Dir).entries { ['hello', 'world'] }
      end

      it 'should return false' do
        @dir.is_git_dir?.should be_false
      end
    end
  end

  describe "#has_post_commit_hook" do
    context "hooks folder contains a post-commit file" do
      before do
        stub(Dir).entries { ['post-commit', 'pre-commit.sample'] }
      end

      it "should return true" do
        @dir.has_post_commit_hook?.should be_true
      end

    end

    context "hooks folder does not contain a post-commit file" do
      before do
        stub(Dir).entries { ['post-commit.sample', 'pre-commit.sample'] }
      end

      it "should return true" do
        @dir.has_post_commit_hook?.should be_false
      end
    end
  end

  describe "#delete_post_commit" do
    before do
      stub(File).exists? { true }
      mock(File).delete("./.git/hooks/post-commit")
    end

    it "should delete the post-commit file" do
      @dir.delete_post_commit
    end
  end

end
