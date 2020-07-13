##
# Core Ext - Rational
#
# Alias di metodi della classe Rational.

class Rational
  alias   :in_intero          :to_i
  alias   :in_decimale        :to_f
  alias   :in_stringa         :to_s
end

Razionale = Rational
