# frozen_string_literal: true

class Time

  class << self
    alias       :adesso               :now
    alias       :alla                 :at
    alias       :al                   :at
  end

  alias         :in_stringa           :to_s
  alias         :in_numero            :to_i
  alias         :formatta             :strftime
  alias         :localizza            :localtime
  alias         :secondi              :sec
  alias         :secondo              :sec
  alias         :minuto               :min
  alias         :minuti               :min
  alias         :ore                  :hour
  alias         :ora                  :hour

  alias         :formatta             :formatta_locale

end

Tempo = Time
