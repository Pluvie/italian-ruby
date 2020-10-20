# frozen_string_literal: true

##
# Parte di una Linea che contiene una definizione di stringa.
#
# La stringa può essere di tipo:
#   - :doppio_apice       => stringa che inizia con ", interpolabile.
#   - :singolo_aplice     => stringa che inizia con ', non interpolabile.
#   - :percentuale_graffa => stringa che iniza con %{, interpolabile.
module Italian
  module Ruby
    class Traduttore
      class Stringa

        attr_accessor :posizione_iniziale
        attr_accessor :posizione_finale

        def initialize(contenuto, posizione_iniziale)
          @contenuto          = contenuto
          @posizione_iniziale = posizione_iniziale

          determina_tipo
        end

        ##
        # Ricerca la posizione del carattere di chiusura della stringa.
        def ricerca_chiusura
          case @tipo
          when :doppio_apice
            @posizione_finale = @contenuto.index /"/,   @posizione_iniziale + 1
          when :singolo_apice
            @posizione_finale = @contenuto.index /'/,   @posizione_iniziale + 1
          when :percentuale_graffa
            @posizione_finale = @contenuto.index /\}/,  posizione_ultima_interpolazione
          end

          raise "la stringa iniziata alla posizione #{@posizione_iniziale} non è terminata" if
            @posizione_finale.nil?
        end

        private

          ##
          # Determina il tipo della stringa.
          def determina_tipo
            carattere_stringa = @contenuto[@posizione_iniziale]

            case carattere_stringa
            when "\"" then @tipo = :doppio_apice
            when "'"  then @tipo = :singolo_apice
            when "%"  then @tipo = :percentuale_graffa
            end
          end

          ##
          # Determina la posizione dell'ultima interpolazione, se presente.
          def posizione_ultima_interpolazione
            posizione_finale = @posizione_iniziale + 2

            inizio_prossima_interpolazione    = @contenuto.index /#\{/, posizione_finale
            while inizio_prossima_interpolazione != nil
              fine_prossima_interpolazione    = @contenuto.index /\}/,  inizio_prossima_interpolazione
              raise "l'interpolazione iniziata alla posizione #{inizio_prossima_interpolazione} non è terminata" if
                fine_prossima_interpolazione.nil?
              posizione_finale                = fine_prossima_interpolazione + 1
              inizio_prossima_interpolazione  = @contenuto.index /#\{/, fine_prossima_interpolazione
            end

            posizione_finale
          end

      end
    end
  end
end
