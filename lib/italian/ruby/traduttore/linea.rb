# frozen_string_literal: true
require_relative "stringa"
require_relative "pezzo"

##
# La classe Linea rappresenta una linea di codice sorgente scritta
# in ItalianRuby.
#
# Una Linea espone il metodo `traduci`, che quando chiamato, effettua
# la traduzione della linea in sorgente Ruby.
#
# La traduzione viene fatta cercando se nella linea ci sono stringhe
# o commenti. Nel caso in cui siano presenti commenti, che iniziano prima di
# ogni altra stringa, tutta la parte di commento viene restituita come tale.
# Se invece vengono trovate delle stringhe, che iniziano prima
# dell'eventuale commento, esse vengono gestite in modo separato.
#
# Per ogni stringa, se essa è interpolabile, viene ricercato se è presente
# un'interpolazione. Se trovata, essa viene re-interpretata come
# una nuova Linea. Altrimenti, la stringa viene restituita come tale.
module Italian
  module Ruby
    class Traduttore
      class Linea

        def initialize(contenuto, indice, nome_archivio)
          @contenuto      = contenuto
          @indice         = indice
          @nome_archivio  = nome_archivio

          trova_posizione_primo_commento
          trova_posizioni_stringhe
        end

        ##
        # Traduce la linea in codice Ruby.
        def traduci
          @pezzi_da_tradurre = []

          if @posizione_primo_commento != nil
            if @stringhe.none? or @posizione_primo_commento < @stringhe[0].posizione_iniziale
              dividi_usando_posizione_commento
            else
              dividi_usando_posizioni_stringhe
            end
          else
            if @stringhe.none?
              dividi_in_pezzo_unico
            else
              dividi_usando_posizioni_stringhe
            end
          end

          @pezzi_da_tradurre.map(&:traduci).join
        end

        private

          ##
          # Trova la posizione del primo commento all'interno della linea.
          def trova_posizione_primo_commento
            @posizione_primo_commento = @contenuto.index "#"
          end

          ##
          # Trova le strighe all'interno della linea. Le stringhe possono iniziare
          # con il doppio apice ("), il singolo apice ('), o il percentuale-graffa (%{).
          def trova_posizioni_stringhe
            @stringhe = []

            stringa_trovata = trova_prossima_stringa_partendo_da 0

            while stringa_trovata != nil
              @stringhe << stringa_trovata

              inizio_nuova_ricerca = stringa_trovata.posizione_finale + 1
              stringa_trovata = trova_prossima_stringa_partendo_da inizio_nuova_ricerca
            end
          end

          ##
          # Trova la prossima stringa sul contenuto, partendo dalla posizione indicata.
          def trova_prossima_stringa_partendo_da(posizione_partenza)
            tipo_stringa_corrente     = nil
            posizione_inizio_stringa  = @contenuto.index /['"]|%\{/, posizione_partenza
            return nil if posizione_inizio_stringa.nil?

            stringa_da_chiudere = Italian::Ruby::Traduttore::Stringa.new @contenuto, posizione_inizio_stringa
            stringa_da_chiudere.ricerca_chiusura
            stringa_da_chiudere
          end

          ##
          # Divide la linea in un pezzo unico, che contiene se stessa.
          def dividi_in_pezzo_unico
            @pezzi_da_tradurre = [ Italian::Ruby::Traduttore::Pezzo.new(@contenuto) ]
          end

          ##
          # Divide la linea in pezzi, usando la posizione del commento.
          def dividi_usando_posizione_commento
            if @posizione_primo_commento == 0
              @pezzi_da_tradurre = [ Italian::Ruby::Traduttore::Pezzo.new(@contenuto) ]
              return
            end

            @pezzi_da_tradurre = [
              Italian::Ruby::Traduttore::Pezzo.new(@contenuto[0..@posizione_primo_commento - 1]),
              Italian::Ruby::Traduttore::Pezzo.new(@contenuto[@posizione_primo_commento..])
            ]
          end

          ##
          # Divide la linea in pezzi, usando le posizioni delle stringhe trovate.
          def dividi_usando_posizioni_stringhe
            @pezzi_da_tradurre  = []
            cursore_contenuto   = 0

            @stringhe.each do |stringa|
              unless stringa.posizione_iniziale == cursore_contenuto
                pezzo_non_stringa = @contenuto[cursore_contenuto..stringa.posizione_iniziale - 1]
                @pezzi_da_tradurre << Italian::Ruby::Traduttore::Pezzo.new(pezzo_non_stringa)
              end

              pezzo_stringa = @contenuto[stringa.posizione_iniziale..stringa.posizione_finale]
              @pezzi_da_tradurre << Italian::Ruby::Traduttore::Pezzo.new(pezzo_stringa)
              cursore_contenuto = stringa.posizione_finale + 1
            end

            if cursore_contenuto < @contenuto.length - 1
              pezzo_non_stringa = @contenuto[cursore_contenuto..]
              @pezzi_da_tradurre << Italian::Ruby::Traduttore::Pezzo.new(pezzo_non_stringa)
            end

            @pezzi_da_tradurre
          end

      end
    end
  end
end
