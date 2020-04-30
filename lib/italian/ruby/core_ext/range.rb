##
# Core Ext - Range
#
# Alias di metodi della classe Range.

class Range
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :mappa                :map
  alias         :in_lista             :to_h

  def non_include?(*args)
    !include? *args
  end
end

Intervallo = Range