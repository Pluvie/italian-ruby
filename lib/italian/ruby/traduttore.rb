# frozen_string_literal: true

require "ruby2ruby"
require "ruby_parser"
require_relative "ruby_parser_patches"

module Italian
  module Ruby
    class Traduttore
      CODICE_INTRODUTTIVO = "# encoding: utf-8\nrequire \"/Users/fballardin/progetti/francy/italian-ruby/lib/italian/ruby/core_ext\"\n"

      def initialize; end

      def traduci(codice)
        ruby2ruby = Ruby2Ruby.new
        parser = RubyParser.new
        sexp = parser.process("# encoding: utf-8\n#{codice}")

        codice_ruby = ruby2ruby.process(sexp)

        "#{CODICE_INTRODUTTIVO}#{codice_ruby}"
      end
    end
  end
end