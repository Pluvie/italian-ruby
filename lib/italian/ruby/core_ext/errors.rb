require "date"

##
# Core Ext - StandardError
#
# Alias di metodi della classe StandardError.

class StandardError
  alias     :messaggio        :message
  alias     :traccia          :backtrace
end

Errore            = StandardError
MetodoInesistente = NoMethodError
ChiaveNonTrovata  = KeyError
DataNonValida     = Date::Error
