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

  def esiste?
    !nil? and self != ""
  end
  alias       :specificato?       :esiste?
  alias       :specificata?       :esiste?

  def non_esiste?
    !esiste?
  end
  alias       :non_specificato?   :non_esiste?
  alias       :non_specificata?   :non_esiste?
end

Stringa = String