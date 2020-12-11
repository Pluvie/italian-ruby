# frozen_string_literal: true

module Process

  class << self
    alias :attendi          :wait
    alias :attendi_tutti    :waitall
    alias :segnala          :kill
  end

end

Processo = Process
