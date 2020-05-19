#####
# Ruby 2.7.0 -> Spegni warning finché non sarà tutto sistemato.
Warning[:experimental] = false
Warning[:deprecated] = false
#####

require "italian/ruby/version"
require "italian/ruby/traduttore"
require "italian/ruby/core_ext"

module Italian
  module Ruby
    class << self

      def translations_dir_path
        path = File.join File.expand_path("~"), ".italian-ruby", "translations"
        FileUtils.mkdir_p path unless Dir.exists? path
        path
      end

    end
  end
end
