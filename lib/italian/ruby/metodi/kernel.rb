# frozen_string_literal: true
require_relative "../errori"

##
# Aggiunge i metodi :richiedi e :richiedi_relativo, che permettono di caricare
# un file sorgente scritto in Italian Ruby e usarlo allo stesso modo di come
# funzionano :require e :require_relative di Ruby standard.
#
# È possibile utilizzare :richiedi e :richiedi_relativo sia in file sorgenti
# scritti in Italian Ruby che in file sorgenti scritti in Ruby standard.
module Kernel

  ##
  # Richiede un archivio da caricare in memoria.
  # Se l'archivio è trovato nei percorsi di caricamento presenti in memoria,
  # e scritto in ItalianRuby, allora viene tradotto e caricato.
  # Altrimenti viene cercato e caricato come un archivio Ruby standard.
  def richiedi(archivio)
    archivi_in_memoria = $:.map do |cartella|
      Dir["#{cartella}/**/#{archivio}.ir"]
    end
    archivio_in_italiano_da_richiedere = archivi_in_memoria.flatten.compact.first
    return traduci_e_carica archivio_in_italiano_da_richiedere if archivio_in_italiano_da_richiedere != nil

    # Non è stato trovato nessun archivio in italiano corrispondente al nome
    # passato. Viene ora tentato il caricamento di un file Ruby originale con
    # lo stesso nome.
    require archivio
  rescue LoadError => errore
    sorgenti_chiamanti = caller_locations.reject do |locazione|
      locazione.absolute_path.include? "lib/italian/ruby/metodi/kernel"
    end
    sorgente_chiamante  = sorgenti_chiamanti.first.absolute_path
    numero_linea_errata = sorgenti_chiamanti.first.lineno
    Italian::Ruby::Errori.recupera errore, sorgente_chiamante, numero_linea_errata
  end

  ##
  # Richiede un archivio cercandolo come percorso relativo.
  def richiedi_relativo(percorso_archivio)
    sorgente_chiamante      = Italian::Ruby.percorso_archivio_non_tradotto caller_locations.first.absolute_path
    linea_chiamante         = caller_locations.first.lineno
    cartella_chiamante      = File.dirname sorgente_chiamante
    archivio_da_richiedere  = File.expand_path File.join(cartella_chiamante, percorso_archivio)
    archivio_da_richiedere  = Dir["#{archivio_da_richiedere}.{ir,rb}"].compact.first

    raise LoadError, "cannot load such file -- #{percorso_archivio}" if archivio_da_richiedere.nil?
    traduci_e_richiedi archivio_da_richiedere
  rescue LoadError => errore
    Italian::Ruby::Errori.recupera errore, sorgente_chiamante, linea_chiamante
  end

  ##
  # Richiede tutti gli archivi di una cartella.
  def richiedi_tutti(percorso_cartella)
    sorgente_chiamante      = Italian::Ruby.percorso_archivio_non_tradotto caller_locations.first.absolute_path
    linea_chiamante         = caller_locations.first.lineno
    cartella_chiamante      = File.dirname sorgente_chiamante
    cartella_da_richiedere  = File.expand_path File.join(cartella_chiamante, percorso_cartella)
    cartella_da_richiedere  = nil unless Dir.exist? cartella_da_richiedere

    raise LoadError, "cannot load such directory -- #{percorso_cartella}" if cartella_da_richiedere.nil?
    Dir["#{cartella_da_richiedere}/**/*.ir"].sort_by { |file| file.count("/") }.each do |archivio|
      traduci_e_richiedi archivio
    end
  rescue LoadError => errore
    Italian::Ruby::Errori.recupera errore, sorgente_chiamante, linea_chiamante
  end

  private

    ##
    # Traduce un file da ItalianRuby a Ruby e lo carica in memoria.
    def traduci_e_carica(archivio)
      archivio_tradotto = Italian::Ruby::Traduttore.traduci archivio
      load archivio_tradotto
    end

    ##
    # Traduce un file da ItalianRuby a Ruby e lo richiede.
    def traduci_e_richiedi(archivio)
      archivio_tradotto = Italian::Ruby::Traduttore.traduci archivio
      require archivio_tradotto
    end

end
