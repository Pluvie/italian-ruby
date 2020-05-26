require_relative  "utils/debug"

module Italian
  module Ruby
    class Errore < StandardError
      class Sintassi < Errore; end
      class NonSupportato < Errore; end
      class IndividuazioneStringa < Errore; end

      def initialize(messaggio = nil, file = nil, riga = 0, posizione = 0)
        @messaggio  = messaggio
        @file       = file
        @riga       = riga
        @posizione  = posizione
        begin
          @linea    = File.readlines(@file)[@riga - 1]
        rescue StandardError => e
          @linea    = "Non è stato possibile recuperare la riga #{@riga} del file."
        end
      end

      def stampa
        prova_ad_ottenere_maggiori_informazioni
        puts "-----------------------------------------------------------------------------".alzavola
        puts "Si è verificato un errore durante la traduzione del file `#{@file}`."
        print "L'errore è: "
        puts "#{self.class}.".rosso
        puts @messaggio
        puts
        print "Riga: "
        puts "#{@riga}".ciano
        puts @linea
        puts "^".rjust(@posizione + 1, " ").verde_lime
        puts
        puts "-----------------------------------------------------------------------------".alzavola
        exit 1
      end

      private

        ##
        # Prova a recuperare maggiori informazioni su errore.
        def prova_ad_ottenere_maggiori_informazioni
          case
          when self.class.is_a?(Sintassi)
            # TO DO
          end
        end

    end
  end
end