require 'spec_helper'

describe Gitstagram do

  describe "#saving_path" do
    it "should return path to the ./gitstagram folder" do
      user = File.expand_path("~").split('/').last
      home = Gitstagram.saving_path.should == "/Users/#{user}/.gitstagram"
    end
  end

end
