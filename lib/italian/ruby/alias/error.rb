# frozen_string_literal: true
require "date"
require "json"

class StandardError

  alias     :messaggio        :message
  alias     :traccia          :backtrace

end

Errore                    = StandardError
ErroreCaricamento         = LoadError
ErroreDiTipo              = TypeError
ErroreDiArgomento         = ArgumentError
MetodoInesistente         = NoMethodError
ChiaveNonTrovata          = KeyError
DataNonValida             = Date::Error
JSON::ErroreProcessazione = JSON::ParserError
