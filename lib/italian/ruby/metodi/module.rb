# frozen_string_literal: true

class Module

  ##
  # Rimanda la costante alla definizione in archivio. La prima volta che viene
  # incontrata la definizione della costante nel codice, allora l'archivio
  # verrà richiesto.
  def rimanda(costante, archivio)
    archivi_in_memoria = $:.map do |cartella|
      Dir["#{cartella}/**/#{archivio}.ir"]
    end
    archivio_da_tradurre    = archivi_in_memoria.flatten.compact.first
    archivio_da_richiedere  = Italian::Ruby.percorso_archivio_tradotto archivio_da_tradurre
    traduci archivio_da_tradurre
    self.autoload costante, archivio_da_richiedere
  end

  ##
  # Come il rimanda, ma usando un percorso relativo.
  def rimanda_relativo(costante, percorso_archivio)
    sorgente_chiamante, linea_chiamante = ottieni_sorgente_e_linea_chiamante caller_locations
    archivio_da_tradurre    = archivio_relativo sorgente_chiamante, percorso_archivio
    archivio_da_richiedere  = Italian::Ruby.percorso_archivio_tradotto archivio_da_tradurre
    traduci archivio_da_tradurre
    self.autoload costante, archivio_da_richiedere
  end

  private

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene incluso.
    def quando_incluso(*args)
    end

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene esteso.
    def quando_esteso(*args)
    end

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene preposto.
    def quando_preposto(*args)
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def included(*args)
      quando_incluso *args
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def extended(*args)
      quando_esteso *args
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def prepended(*args)
      quando_preposto *args
    end

    ##
    # Crea un alias per un metodo.
    def metodo_alias(alias_name, method_name)
      alias_method alias_name, method_name
    end

end
