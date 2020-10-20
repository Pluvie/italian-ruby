# frozen_string_literal: true
RSpec::Matchers::BuiltIn

module RSpec
  module Core
    class ExampleGroup
      class << self
        alias     :includi_variabili  :include_context
        alias     :includi_contesto   :include_context
      end
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

  module Matchers
    module BuiltIn
      class Change
        alias     :di               :by
        alias     :da               :from
      end

      class Equal
        alias     :o                :or
      end

      class ChangeFromValue
        alias     :a                :to
      end
    end
  end

  module Mocks
    module ExampleMethods
      alias     :imita              :instance_double
      alias     :imita_classe       :class_double
      alias     :spia               :spy
    end

    class MessageExpectation
      alias     :e_ritorni          :and_return
      alias     :e_chiami_originale :and_call_original
    end

    class VerifyingMessageExpectation
      alias     :con                :with
      alias     :esattamente        :exactly
      alias     :volte              :times
      alias     :volta              :times
    end

    module Matchers
      class Receive
        alias   :con                :with
        alias   :esattamente        :exactly
        alias   :volte              :times
        alias   :volta              :times
      end

      class HaveReceived
        alias   :con                :with
        alias   :esattamente        :exactly
        alias   :volte              :times
        alias   :volta              :times
      end
    end

    module ArgumentMatchers
      alias     :mappa_che_include  :hash_including
    end

  end
end

##
# Definisce alias per alcuni matcher.
RSpec.configure do |config|
  RSpec::Matchers.alias_matcher :sia,               :be
  RSpec::Matchers.alias_matcher :siano,             :be
  RSpec::Matchers.alias_matcher :sia_nullo,         :be_nil
  RSpec::Matchers.alias_matcher :sia_nulla,         :be_nil
  RSpec::Matchers.alias_matcher :tutti,             :all
  RSpec::Matchers.alias_matcher :tutte,             :all
  RSpec::Matchers.alias_matcher :equivalga_a,       :eq
  RSpec::Matchers.alias_matcher :equivalgano_a,     :eq
  RSpec::Matchers.alias_matcher :alzi_errore,       :raise_error
  RSpec::Matchers.alias_matcher :riceva,            :receive
  RSpec::Matchers.alias_matcher :abbia_ricevuto,    :have_received
  RSpec::Matchers.alias_matcher :cambi,             :change
  RSpec::Matchers.alias_matcher :di,                :by
  RSpec::Matchers.alias_matcher :includa,           :include
  RSpec::Matchers.alias_matcher :includano,         :include
  RSpec::Matchers.alias_matcher :corrisponda_a,     :match
  RSpec::Matchers.alias_matcher :corrispondano_a,   :match

  config.alias_example_to :esso
  config.alias_example_to :essa

  config.before :each do
    alias         :verifica           :expect
    alias         :consenti           :allow
  end
end
