require_relative  "utils/debug"

module Italian
  module Ruby
    class Errore < StandardError
      class NonSupportato < Errore; end
      class IndividuazioneStringa < Errore; end

      def initialize(messaggio = nil, file = nil, linea = nil, riga = 0, posizione = 0)
        @messaggio  = messaggio
        @file       = file
        @linea      = linea
        @riga       = riga
        @posizione  = posizione
      end

      def stampa
        puts "-----------------------------------------------------------------------------".alzavola
        puts "Si è verificato un errore durante la traduzione del file `#{@file}`."
        print "L'errore è: "
        puts "#{@classe}.".rosso
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
    end
  end
end