require "italian/ruby/core_ext/rspec/core"
require "italian/ruby/core_ext/rspec/expectations"

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |config|
    config.syntax = :expect
  end
end