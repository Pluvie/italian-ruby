# frozen_string_literal: true

class Float

  INFINITO = INFINITY

  alias       :in_intero                    :to_i
  alias       :in_decimale                  :to_f
  alias       :in_stringa                   :to_s
  alias       :arrotonda                    :round
  alias       :arrotonda_per_eccesso        :ceil
  alias       :arrotonda_per_difetto        :floor
  alias       :valore_assoluto              :abs

end

Decimale = Float
