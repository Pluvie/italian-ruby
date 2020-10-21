# frozen_string_literal: true
require_relative "errori"
require_relative "traduttore/linea"

##
# Traduttore per codice sorgente ItalianRuby.
#
# Il traduttore espone un metodo di classe `traduci`, che può
# essere chiamato passando un archivio o un blocco.
# Viene restituito lo stesso archivio o blocco tradotto in sorgente Ruby.
#
# Nella traduzione viene mantenuta la perfetta corrispondenza
# fra i numeri di linea, in modo tale da facilitare la lettura delle
# eventuali tracce di errore.
module Italian
  module Ruby
    class Traduttore

      ##
      # Bandierina per stampare o meno i dettagli della traduzione,
      # mentre questa viene eseguita.
      STAMPA_DETTAGLI_TRADUZIONE = false

      ##
      # Punto d'ingresso del traduttore. Questo metodo esegue del codice Ruby
      # presente in un archivio. Il codice può essere stato precedentemente
      # tradotto dal metodo `traduci` del traduttore ItalianRuby.
      def self.esegui(percorso_archivio_tradotto)
        load percorso_archivio_tradotto
      rescue SyntaxError => errore
        Italian::Ruby::Errori.recupera errore, percorso_archivio_tradotto
      rescue StandardError => errore
        Italian::Ruby::Errori.recupera errore, percorso_archivio_tradotto
      end

      ##
      # Punto d'ingresso del traduttore. Questo metodo accetta un archivio 
      # come argomento principale, oppure un blocco di codice. 
      def self.traduci(archivio = nil, sorgente = nil, &block)
        return traduci_archivio   archivio  if archivio != nil
        return traduci_sorgente   sorgente  if sorgente != nil
        return traduci_blocco     &blocco   if block_given?
      end

      private

        ##
        # Traduce un archivio sorgente da ItalianRuby a Ruby.
        # Salva la versione tradotta dell'archivio originale nel percorso
        # delle traduzioni.
        def self.traduci_archivio(archivio)
          puts "Traduzione archivio: #{archivio}"             if STAMPA_DETTAGLI_TRADUZIONE

          linee_sorgente = File.readlines archivio
          linee_tradotte = linee_sorgente.map.with_index do |linea, numero_linea|
            linea_da_tradurre = Italian::Ruby::Traduttore::Linea.new linea, numero_linea, archivio
            linea_tradotta = linea_da_tradurre.traduci

            puts "\t[#{numero_linea}] <- #{linea}"            if STAMPA_DETTAGLI_TRADUZIONE
            puts "\t[#{numero_linea}] -> #{linea_tradotta}"   if STAMPA_DETTAGLI_TRADUZIONE

            linea_tradotta.chomp
          end

          puts "Traduzione terminata."                        if STAMPA_DETTAGLI_TRADUZIONE
          puts                                                if STAMPA_DETTAGLI_TRADUZIONE

          linee_tradotte              = linee_tradotte.join("\n").freeze
          archivio_tradotto           = Italian::Ruby.percorso_archivio_tradotto archivio
          cartella_archivio_tradotto  = File.dirname archivio_tradotto
          FileUtils.mkdir_p cartella_archivio_tradotto unless Dir.exist? cartella_archivio_tradotto

          File.write archivio_tradotto, linee_tradotte
          archivio_tradotto
        rescue SyntaxError => errore
          Italian::Ruby::Errori.recupera errore, archivio
        end

        ##
        # Traduce un pezzo di sorgente da ItalianRuby a Ruby.
        def self.traduci_sorgente(sorgente)
          puts "Traduzione sorgente."                         if STAMPA_DETTAGLI_TRADUZIONE

          linee_sorgente  = sorgente.split "\n"
          linee_tradotte  = linee_sorgente.map.with_index do |linea, numero_linea|
            linea_da_tradurre = Italian::Ruby::Traduttore::Linea.new linea, numero_linea, nil
            linea_tradotta = linea_da_tradurre.traduci

            puts "\t[#{numero_linea}] <- #{linea}"            if STAMPA_DETTAGLI_TRADUZIONE
            puts "\t[#{numero_linea}] -> #{linea_tradotta}"   if STAMPA_DETTAGLI_TRADUZIONE

            linea_tradotta.chomp
          end

          puts "Traduzione terminata."                        if STAMPA_DETTAGLI_TRADUZIONE
          puts                                                if STAMPA_DETTAGLI_TRADUZIONE

          sorgente_tradotto = linee_tradotte.join("\n").freeze
          sorgente_tradotto
        end

        ##
        # Traduce un blocco di codice da ItalianRuby a Ruby.
        def self.traduci_blocco(&blocco)
          blocco.call
        rescue StandardError => errore
          Italian::Ruby::Errori.recupera errore, __FILE__
        end

    end
  end
end
