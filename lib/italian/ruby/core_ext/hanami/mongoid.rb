##
# Core Ext - Hanami Mongoid

module Hanami
  module Mongoid
    class Repository

      def tutti(*args, &block)
        all *args, &block
      end

    end
  end
end