# frozen_string_literal: true

class String

  ##
  # Codici colori.
  CODICI_COLORI = Hash[
    rosso:            "31",
    verde:            "32",
    giallo:           "33",
    blu:              "34",
    magenta:          "35",
    azzurro:          "36",
    arancione:        "38;5;214",
    verde_pallido:    "38;5;157"
  ].freeze

  ##
  # Metodi per la colorizzazione delle stringhe,
  # quando stampate a terminale.
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

    def bianco
      self
    end

    def rosso
      colorize CODICI_COLORI[:rosso]
    end

    def verde
      colorize CODICI_COLORI[:verde]
    end

    def giallo
      colorize CODICI_COLORI[:giallo]
    end

    def blu
      colorize CODICI_COLORI[:blu]
    end

    def magenta
      colorize CODICI_COLORI[:magenta]
    end

    def azzurro
      colorize CODICI_COLORI[:azzurro]
    end

    def arancione
      colorize CODICI_COLORI[:arancione]
    end

    def verde_pallido
      colorize CODICI_COLORI[:verde_pallido]
    end

    def decolorizza
      self.gsub /(\u001b\[3\dm|\u001b\[3\d;\d;\d\d\dm|\u001b\[0m)/, ""
    end

    def disaccoppia_colore
      return [ nil, self ]    if self.decolorizza == self
      parte_colore            = self.scansiona /\u001b\[3[\d;]+m/
      codice_colore           = parte_colore.prima[2..-2]
      colore                  = CODICI_COLORI.invert.fetch codice_colore

      [ colore, self.decolorizza ]
    end

  ##
  # Determina se la stringa esiste e non è vuota.
  def esiste?
    !nil? and self != ""
  end

  ##
  # Determina se la stringa non include un'altra stringa.
  def non_include?(*args)
    !include? *args
  end

  ##
  # Determina se la stringa non inizia con un'altra stringa.
  def non_inizia_con?(*args)
    !inizia_con? *args
  end

  ##
  # Determina se la stringa non finisce con un'altra stringa.
  def non_finisce_con?(*args)
    !finisce_con? *args
  end

  ##
  # Converte la stringa in data.
  def in_data
    return unless defined? Date
    Date.parse self
      .gsub(/gennaio/i,   "JAN")
      .gsub(/maggio/i,    "MAY")
      .gsub(/giugno/i,    "JUN")
      .gsub(/luglio/i,    "JUL")
      .gsub(/agosto/i,    "AUG")
      .gsub(/settembre/i, "SEP")
      .gsub(/ottobre/i,   "OCT")
      .gsub(/dicembre/i,  "DEC")
      .gsub(/GEN/i,       "JAN")
      .gsub(/MAG/i,       "MAY")
      .gsub(/GIU/i,       "JUN")
      .gsub(/LUG/i,       "JUL")
      .gsub(/AGO/i,       "AUG")
      .gsub(/SET/i,       "SEP")
      .gsub(/OTT/i,       "OCT")
      .gsub(/DIC/i,       "DEC")
  end

  ##
  # Converte la stringa in tempo.
  def in_tempo
    return unless defined? Time
    Time.parse self
      .gsub(/gennaio/i,   "JAN")
      .gsub(/maggio/i,    "MAY")
      .gsub(/giugno/i,    "JUN")
      .gsub(/luglio/i,    "JUL")
      .gsub(/agosto/i,    "AUG")
      .gsub(/settembre/i, "SEP")
      .gsub(/ottobre/i,   "OCT")
      .gsub(/dicembre/i,  "DEC")
      .gsub(/GEN/i,       "JAN")
      .gsub(/MAG/i,       "MAY")
      .gsub(/GIU/i,       "JUN")
      .gsub(/LUG/i,       "JUL")
      .gsub(/AGO/i,       "AUG")
      .gsub(/SET/i,       "SEP")
      .gsub(/OTT/i,       "OCT")
      .gsub(/DIC/i,       "DEC")
  end

  ##
  # Converte la stringa nella classe con lo steso nome.
  def in_classe
    Object.const_get self
  end

  ##
  # Restituisce i primi n caratteri della stringa.
  def primi(n)
    self[0..(n - 1)]
  end

  ##
  # Restituisce il primo carattere della stringa.
  def primo_carattere
    self[0]
  end

  ##
  # Restituisce l'ultimo carattere della stringa.
  def ultimo_carattere
    self[-1]
  end

  ##
  # Restituisce la stringa escludendo i primi n caratteri.
  def salta_caratteri(n)
    self[(n - 1)..-1]
  end

  ##
  # Restituisce la stringa escludendo il primo carattere.
  def salta_il_primo_carattere
    self[1..-1]
  end

  ##
  # Restituisce la stringa togliendo gli ultimi n caratteri.
  def tronca_caratteri(n)
    self[0..(-1 - n)]
  end

  ##
  # Restituisce la stringa togliendo l'ultimo carattere.
  def tronca
    self[0..-2]
  end

  ##
  # Adatta la stringa alla lunghezza specificata.
  # Se la stringa è più lunga, la tronca e mette dei puntini di sospensione.
  # Se la stringa è più corta, aggiunge n spazi vuoti alla fine per coprire.
  def adatta(l)
    if self.length > l
      "#{self[0..l - 3]}.."
    else
      self.ljust l, " "
    end
  end

  ##
  # Restituisce l'ultimo indice della stringa.
  def ultimo_indice
    self.length - 1
  end

  ##
  # Rappresentazione per stampa.
  def _stampa(*args)
    %{"#{self}"}.giallo
  end

end
