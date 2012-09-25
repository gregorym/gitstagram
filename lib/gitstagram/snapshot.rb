module Gitstagram
  class Snapshot

    class << self

      #
      # Takes a snapshot
      #
      def smile
        Gitstagram::SystemCaller.call ".#{Gitstagram.tools_path}/imagesnap -q -w 3 #{Gitstagram.saving_path}"
      end

    end

  end
end