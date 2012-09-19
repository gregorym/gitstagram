require 'spec_helper'

describe Gitstagram::GitDir do
  
  describe "#is_git_directory?" do
    before do
      @dir = Gitstagram::GitDir.new('.')
    end

    context 'folder contains a .git directory' do
      before do
        stub(Dir).glob { ['.git'] }
      end

      it 'should return true' do
        @dir.is_git_dir?.should be_true
      end
    end

    context 'folder does not contain a .git directory' do
      before do
        stub(Dir).glob { ['hello', 'world'] }
      end

      it 'should return false' do
        @dir.is_git_dir?.should be_false
      end
    end
  
  end

end
