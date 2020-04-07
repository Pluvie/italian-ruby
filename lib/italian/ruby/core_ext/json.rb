##
# CoreExt - JSON

class JSON
  class << self
    alias       :processa           :parse
  end
end