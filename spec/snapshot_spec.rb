require 'spec_helper'

describe Gitstagram::Snapshot do
  
  describe "#saving_path" do
    it "should return path to the ./gitstagram folder" do
      user = File.expand_path("~").split('/').last
      home = Gitstagram::Snapshot.saving_path.should == "/Users/#{user}/.gitstagram"
    end
  end

  describe "#smile" do
    before do
      command = ".#{Gitstagram.tools_path}/imagesnap -q -w 3 #{Gitstagram::Snapshot.saving_path}"
      mock(Gitstagram::SystemCaller).call(command)
    end

    it "should take a snapshot" do
      Gitstagram::Snapshot.smile
    end
  end

end