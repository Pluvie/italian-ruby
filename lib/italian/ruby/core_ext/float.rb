##
# Core Ext - Float
#
# Alias di metodi della classe Float.

class Float
  INFINITO = INFINITY

  alias       :in_intero                    :to_i
  alias       :arrotonda                    :round
  alias       :arrotonda_per_eccesso        :ceil
  alias       :arrotonda_per_difetto        :floor
  alias       :valore_assoluto              :abs
end

Decimale = Float
