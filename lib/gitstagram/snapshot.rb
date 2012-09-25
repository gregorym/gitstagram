module Gitstagram
  class Snapshot

    class << self

      #
      # Returns the path where snapshots will be saved.
      #
      def saving_path
        path = File.expand_path("~") + '/.gitstagram'
      
        Dir.mkdir(path) unless Dir.exists?(path)
        path
      end

      #
      # Takes a snapshot
      #
      def smile
        Gitstagram::SystemCaller.call ".#{Gitstagram.tools_path}/imagesnap -q -w 3 #{saving_path}"
      end

    end

  end
end