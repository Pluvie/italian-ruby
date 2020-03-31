##
# Core Ext - Time
#
# Alias di metodi della classe Time.

class Time
  class << self
    alias       :adesso       :now
    alias       :alla         :at
    alias       :al           :at
  end
end

Tempo = Time