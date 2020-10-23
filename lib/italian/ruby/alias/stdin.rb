# frozen_string_literal: true

class STDIN

  class << self
    alias   :ottieni        :gets
  end

end

Ingresso = STDIN
