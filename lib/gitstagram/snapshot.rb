module Gitstagram
  class Snapshot

    class << self

      #
      # Takes a snapshot
      #
      def smile
        saving_path = Gitstagram.saving_path + "/#{Time.now.to_i}.jpg"
        Gitstagram::SystemCaller.call "#{Gitstagram.tools_path}/imagesnap -q -w 3 #{saving_path} &"
      end

    end

  end
end