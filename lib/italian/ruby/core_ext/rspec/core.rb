##
# Core Ext - Rspec Core

module RSpec
  def self.descrivi(*args, &block)
    describe *args, &block
  end

  module Core
    module Hooks
      alias_method    :prima,       :before
      alias_method    :dopo,        :after
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