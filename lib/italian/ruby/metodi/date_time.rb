# frozen_string_literal: true

class DateTime

  ##
  # Restituisce il numero di millisecondi trascorsi dalla Unix Epoch.
  def to_unix_ms
    strftime("%Q").to_i
  end
  alias :in_unix_ms :to_unix_ms

end
