##
# Core Ext - String
#
# Alias di metodi della classe String.

class String
  alias       :congela            :freeze
  alias       :prima_maiuscola    :capitalize
  alias       :in_simbolo         :to_sym
  alias       :dividi             :split
end

Stringa = String