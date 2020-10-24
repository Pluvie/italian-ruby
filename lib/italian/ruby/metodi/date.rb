# frozen_string_literal: true
require "date"

class Date
  class << self

    ##
    # Restituisce la data di domani.
    def domani
      oggi + 1
    end
  
    ##
    # Restituisce la data di ieri.
    def ieri
      oggi - 1
    end

  end

  ##
  # Restituisce la data di oggi a due anni fa.
  def due_anni_fa
    self.prev_year.prev_year
  end

  ##
  # Formatta la data secondo la rappresentazione passata.
  def formatta_locale(format)
    if defined? I18n
      I18n.l self, format: format
    else
      strftime format
    end
  end

end
