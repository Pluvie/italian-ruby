# frozen_string_literal: true

module Process

  class << self
    alias :attendi          :wait
    alias :attendi_tutti    :waitall
    alias :segnala          :kill
    alias :imposta_nome     :setproctitle
    alias :distacca         :detach
  end

end

Processo = Process
