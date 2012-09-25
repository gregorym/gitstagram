require 'spec_helper'

describe Gitstagram::MovieMaker do

  describe "#build" do
    before do
      command = ".#{Gitstagram.tools_path}/tlassemble #{Gitstagram.saving_path} gitstagram.mov -quiet yes"
      mock(Gitstagram::SystemCaller).call(command)
    end

    it "should build the timelapse" do
      Gitstagram::MovieMaker.build
    end
  end

end