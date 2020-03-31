##
# Core Ext - Date
#
# Alias di metodi della classe Date.

class Date
  class << self
    alias       :oggi         :today
  end
end

Data = Date