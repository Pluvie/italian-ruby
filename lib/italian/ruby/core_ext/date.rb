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
end

Data = Date