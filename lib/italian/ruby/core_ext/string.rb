##
# Core Ext - String
#
# Alias di metodi della classe String.

class String
  alias       :congela            :freeze
  alias       :prima_maiuscola    :capitalize
  alias       :in_simbolo         :to_sym
  alias       :in_stringa         :to_s
  alias       :dividi             :split
  alias       :maiuscola          :upcase
  alias       :maiuscolo          :upcase
  alias       :minuscola          :downcase
  alias       :minuscolo          :downcase

  def esiste?
    !nil? and self != ""
  end
end

Stringa = String