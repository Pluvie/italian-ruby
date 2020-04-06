require "date"

##
# Core Ext - Date
#
# Alias di metodi della classe Date.

class Date
  class << self
    alias       :oggi             :today
    alias       :converti         :parse
  end

  alias         :anno_prossimo    :next_year
  alias         :in_stringa       :to_s
end

Data = Date