require "italian/ruby/metodi/rspec"
require "italian/ruby/alias/rspec"

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |config|
    config.syntax = :expect
  end
end
