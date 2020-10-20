# frozen_string_literal: true
require "rspec"
require "rspec/mocks"

module RSpec

  def self.descrivi(*args, &block)
    describe *args, &block
  end
  def self.variabili_condivise(*args, &block)
    shared_context *args, &block
  end
  def self.contesto_condiviso(*args, &block)
    shared_context *args, &block
  end

  module Core
    class ExampleGroup
      define_example_group_method     :contesto

      def classe_descritta
        described_class
      end

      def risposta(*args, &block)
        last_response *args, &block
      end
    end
  end

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

  module Mocks
    class TargetBase
      def che(*args)
        to *args
      end
      def che_non(*args)
        not_to *args
      end

      private

        def matcher_allowed?(matcher)
          matcher.class.name.start_with?("RSpec::Mocks::Matchers".freeze) or
          matcher.class.name.start_with?("RSpec::Matchers::AliasedMatcher".freeze)
        end

    end

  end
end
