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

  ##
  # Restituisce la rappresentazione in byte (unsigned char) del numero intero.
  def u8
    raise RangeError, "#{self} out of u8 range" if (self >= 256)
    self.chr
  end

  ##
  # Restituisce la rappresentazione in byte (unsigned short) del numero intero.
  def u16
    raise RangeError, "#{self} out of u16 range" if (self >= 65536)
    return "#{self.u8}#{0.u8}" if self < 256
    first_byte = self & 0b000000011111111
    second_byte = self >> 8
    "#{first_byte.u8}#{second_byte.u8}"
  end

end
