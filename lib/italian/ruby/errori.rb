# frozen_string_literal: true

##
# Modulo per la gestione degli errori rilevati durante
# l'esecuzione di codice Ruby tradotto da ItalianRuby.
module Italian
  module Ruby
    module Errori

      ##
      # Errore stringa non terminata.
      class StringaNonTerminata < StandardError; end

      ##
      # Nomi classi errori tradotti.
      TRADUZIONI_NOMI_CLASSI_ERRORI = Hash[
        "SyntaxError"   => "ErroreSintassi",
        "LoadError"     => "ErroreCaricamento"
      ].freeze

      def self.recupera(errore, archivio, numero_linea = nil)
        linee_sorgente          = File.readlines archivio
        numero_linea_errata     = numero_linea                                    if numero_linea != nil
        numero_linea_errata     = ottieni_numero_linea_errata_da errore, archivio if numero_linea_errata.nil?
        linea_errata            = linee_sorgente[numero_linea_errata - 1].strip
        linea_errata_precedente = linee_sorgente[numero_linea_errata - 2].strip   if numero_linea_errata >= 2
        linea_errata_successiva = linee_sorgente[numero_linea_errata].strip       if numero_linea_errata < linee_sorgente.length
        nome_classe_errore      = TRADUZIONI_NOMI_CLASSI_ERRORI.fetch errore.class.name, nil
        nome_classe_errore      = errore.class.name                               if nome_classe_errore.nil?

        puts "-------".rosso
        puts "Si è verificato un errore: #{nome_classe_errore}.".rosso
        puts
        puts "\t  [#{numero_linea_errata - 1}] #{linea_errata_precedente}".rosso  if linea_errata_precedente != nil
        puts "\t> [#{numero_linea_errata}] #{linea_errata}".rosso
        puts "\t  [#{numero_linea_errata + 1}] #{linea_errata_successiva}".rosso  if linea_errata_successiva != nil
        puts
        puts errore.message.rosso
        puts errore.backtrace.map(&:rosso)
        puts "-------".rosso

        exit
      end

      private

        ##
        # Ottiene il numero della linea errata dal messaggio d'errore.
        def self.ottieni_numero_linea_errata_da(errore, archivio)
          case errore.class.name
          when "SyntaxError"
            errore.message.partition(":").last.partition(":").first.to_i
          else
            traccia_errore = errore.backtrace.find do |traccia|
              traccia.include? archivio
            end
            traccia_errore.partition(":").last.partition(":").first.to_i
          end
        rescue
          nil
        end

    end
  end
end
