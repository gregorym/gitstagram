module Gitstagram
  class MovieMaker

    class << self
      def build
        Gitstagram::SystemCaller.call ".#{Gitstagram.tools_path}/tlassemble #{Gitstagram.saving_path} gitstagram.mov -quiet yes"
      end
    end

  end
end