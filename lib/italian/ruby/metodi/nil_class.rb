# frozen_string_literal: true

class NilClass

  ##
  # Determina se il nullo non è tale.
  def esiste?
    !nil?
  end

  ##
  # Rappresentazione per stampa.
  def _stampa(*args)
    "nullo".azzurro
  end

end
