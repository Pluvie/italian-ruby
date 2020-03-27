# frozen_string_literal: true
require "ruby2ruby"
require "ruby_parser"
require_relative "ruby_parser_patches"

module Italian
  module Ruby
    class Traduttore

      class << self

        def traduci(file)
          begin
            @@ruby2ruby ||= Ruby2Ruby.new
            @@parser    ||= RubyParser.new
            
            codice      = File.read file
            sexp        = @@parser.process("# encoding: utf-8\n#{codice}")
            codice_ruby = @@ruby2ruby.process(sexp)

            "# encoding: utf-8\n#{codice_ruby}"
          rescue StandardError => error
            raise "Errore nella traduzione del file #{file}.\n"\
              "#{error.message}\n#{error.backtrace.join("\n")}"
          end
        end

      end

    end
  end
end