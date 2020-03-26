# frozen_string_literal: true
require "ruby2ruby"
require "ruby_parser"
require_relative "ruby_parser_patches"

module Italian
  module Ruby
    class Traduttore

      class << self

        def traduci(file)
          @@ruby2ruby ||= Ruby2Ruby.new
          @@parser    ||= RubyParser.new
          
          codice      = File.read file
          sexp        = @@parser.process("# encoding: utf-8\n#{codice}")
          codice_ruby = @@ruby2ruby.process(sexp)

          "# encoding: utf-8\n#{codice_ruby}"
        end

      end

    end
  end
end