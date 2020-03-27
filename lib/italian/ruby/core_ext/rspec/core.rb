##
# Core Ext - Rspec Core

module RSpec
  def self.descrivi(*args, &block)
    describe *args, &block
  end

  module Core
    class ExampleGroup
      alias       :classe_descritta   :described_class
    end

    module Hooks
      alias       :prima              :before
      alias       :dopo               :after
    end

    module MemoizedHelpers
      module ClassMethods
        alias     :sia                :let
        alias     :sia!               :let!
        alias     :soggetto           :subject
        alias     :soggetto!          :subject!
      end
    end
  end
end

RSpec.configure do |config|
  RSpec::Matchers.alias_matcher :sia,               :be
  RSpec::Matchers.alias_matcher :equivalga_a,       :eq

  config.alias_example_to :esso
  config.alias_example_to :essa

  config.before :each do
    alias         :verifica           :expect
  end
end