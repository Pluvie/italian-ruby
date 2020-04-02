##
# Core Ext - Integer
#
# Alias di metodi della classe Integer.

class Integer
  alias       :volte          :times
  alias       :in_decimale    :to_f

  def secondi
    self
  end
  alias       :secondo        :secondi

  def minuti
    self.secondi * 60
  end
  alias       :minuto         :minuti

  def ore
    self.minuti * 60
  end
  alias       :ora            :ore

  def giorni
    self.ore * 24
  end
  alias       :giorno         :giorni

  def fa
    Time.now - self
  end

  def da_ora
    Time.now + self
  end
end

Intero = Integer