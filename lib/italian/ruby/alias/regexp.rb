# frozen_string_literal: true

class Regexp

  class << self

    alias :despecializza    :quote

  end

end

EspressioneRegolare = Regexp
