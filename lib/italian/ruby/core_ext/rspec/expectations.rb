##
# Core Ext - Rspec Expectations

module RSpec
  module Expectations
    class ExpectationTarget
      module InstanceMethods
        def che(*args, &block)
          to *args, &block
        end

        def che_non(*args, &block)
          not_to *args, &block
        end
      end
    end
  end
end