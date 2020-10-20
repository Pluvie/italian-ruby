# frozen_string_literal: true

class Integer

  ##
  # Restituisce l'ammontare di secondi corrispondenti
  # al numero passato.
  def secondi
    self
  end

  ##
  # Restituisce l'ammontare di minuti corrispondenti
  # al numero passato.
  def minuti
    self.secondi * 60
  end

  ##
  # Restituisce l'ammontare di ore corrispondenti
  # al numero passato.
  def ore
    self.minuti * 60
  end

  ##
  # Restituisce l'ammontare di giorni corrispondenti
  # al numero passato.
  def giorni
    self.ore * 24
  end

  ##
  # Sottrae il numero di secondi dal tempo attuale.
  def fa
    Time.now - self
  end

  ##
  # Aggiunge il numero di secondi dal tempo attuale.
  def da_ora
    Time.now + self
  end

end
