require 'spec_helper'

describe Gitstagram::Snapshot do

  describe "#smile" do
    before do
      command = ".#{Gitstagram.tools_path}/imagesnap -q -w 3 #{Gitstagram.saving_path}"
      mock(Gitstagram::SystemCaller).call(command)
    end

    it "should take a snapshot" do
      Gitstagram::Snapshot.smile
    end
  end

end