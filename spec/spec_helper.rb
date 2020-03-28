require "rspec/mocks"
require "italian/ruby/core_ext/gems/rspec"

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |config|
    config.syntax = :expect
  end
end