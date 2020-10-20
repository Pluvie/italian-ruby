require "fileutils"

require_relative "ruby/metodi"
require_relative "ruby/alias"

require_relative "ruby/versione"
require_relative "ruby/traduttore"

module Italian
  module Ruby

    ##
    # Ottiene il percorso dove salvare tutti i file con estensione .ir
    # nella relativa versione tradotta (che avrà estensione .rb).
    def self.cartella_traduzioni
      percorso = File.join cartella_casa, ".italian-ruby", "traduzioni"
      FileUtils.mkdir_p percorso unless Dir.exists? percorso
      percorso
    end

    ##
    # Ottiene il percorso della cartella casa dell'utente corrente.
    def self.cartella_casa
      File.expand_path "~"
    end

    ##
    # Restituisce il percorso tradotto di un archivio.
    def self.percorso_archivio_tradotto(percorso_archivio)
      File.join Italian::Ruby.cartella_traduzioni,
        File.expand_path(percorso_archivio).gsub(/\.ir$/, ".rb")
    end

    ##
    # Restituisce il percorso non tradotto di un archivio.
    def self.percorso_archivio_non_tradotto(percorso_archivio)
      return percorso_archivio unless percorso_archivio.respond_to? :partition
      percorso_archivio.partition(cartella_traduzioni).last.gsub(/\.rb$/, ".ir")
    end

  end
end
