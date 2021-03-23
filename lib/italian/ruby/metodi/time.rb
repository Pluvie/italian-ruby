# frozen_string_literal: true

class Time

  ##
  # Converte il tempo in data.
  def in_data
    self.to_date
  end

  ##
  # Converte il tempo in se stesso.
  def in_tempo
    self
  end

  ##
  # Formatta il tempo secondo la stringa passata.
  def formatta_locale(format)
    if defined? I18n
      I18n.l self, format: format
    else
      strftime format
    end
  end

  ##
  # Sposta il tempo alle ore specificate.
  def alle(ore, minuti = 0, secondi = 0)
    Time.new(self.year, self.month, self.day, ore, minuti, secondi)
  end

  ##
  # Ritorna il tempo all'inizio del giorno.
  def inizio_giorno
    Time.new(self.year, self.month, self.day)
  end

  ##
  # Ritorna il tempo alla fine del giorno.
  def fine_giorno
    Time.new(self.year, self.month, self.day, 23, 59, 59)
  end

  ##
  # Ritorna il tempo all'inizio dell'ora.
  def inizio_ora
    Time.new(self.year, self.month, self.day, self.hour)
  end

  ##
  # Ritorna il tempo alla fine dell'ora.
  def fine_ora
    Time.new(self.year, self.month, self.day, self.hour, 59, 59)
  end

  ##
  # Ritorna il tempo all'inizio del minuto.
  def inizio_minuto
    Time.new(self.year, self.month, self.day, self.hour, self.min)
  end

  ##
  # Ritorna il tempo alla fine del minuto.
  def fine_minuto
    Time.new(self.year, self.month, self.day, self.hour, self.min, 59)
  end

  ##
  # Rappresentazione per stampa.
  def _stampa(*args)
    "#{in_data.formatta "%d %B %Y"} #{strftime "%H:%M:%S %z"}".arancione
  end

end
