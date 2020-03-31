##
# Core Ext - Float
#
# Alias di metodi della classe Float.

class Float
  alias       :in_intero                    :to_i
  alias       :arrontonda                   :round
  alias       :arrotonda_per_eccesso        :ceil
  alias       :arrotonda_per_difetto        :floor
end

Decimale = Float