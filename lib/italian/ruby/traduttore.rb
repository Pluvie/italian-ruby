# frozen_string_literal: true
require           "rainbow"
require_relative  "utils/debug"

module Italian
  module Ruby
    class Traduttore

      class Errore < StandardError
        attr_accessor :messaggio, :file, :linea, :riga, :posizione

        def initialize(messaggio: nil, file: nil, linea: nil, riga: 0, posizione: 0)
          @messaggio  = messaggio
          @file       = file
          @linea      = linea
          @riga       = riga
          @posizione  = posizione
        end

        class NonSupportato < Errore; end
        class IndividuazioneStringa < Errore; end
      end

      class << self

        def traduci(file)
          begin
            codice_tradotto = File.readlines(file).map.with_index do |linea, riga|
              traduci_linea file, linea, riga
            end
          rescue Italian::Ruby::Traduttore::Errore => errore
            puts "-----------------------------------------------------------------------------".alzavola
            puts "Si è verificato un errore durante la traduzione del file `#{errore.file}`."
            print "L'errore è: "
            puts "#{errore.classe}.".rosso
            puts errore.messaggio
            puts
            print "Riga: "
            puts "#{errore.riga}".ciano
            puts errore.linea
            puts "^".rjust(errore.posizione + 1, " ").verde_lime
            puts
            puts "-----------------------------------------------------------------------------".alzavola
          end
        end

        def traduci_linea(file, linea, riga)
          puts "Traduco linea  [#{riga}]: #{linea.inspect}".magenta
          posizione_commento         = linea.index(%{#}) || linea.length
          posizione_stringa_singola  = linea.index(%{'}) || linea.length
          posizione_stringa_doppia   = linea.index(%{"}) || linea.length
          contesto = [
            file, linea, riga,
            posizione_commento,
            posizione_stringa_singola,
            posizione_stringa_doppia ]

          controlla_stringa_singola *contesto
          controlla_stringa_doppia  *contesto
          linea_tradotta = traduci_pezzo linea

          puts "Linea tradotta [#{riga}]: #{linea_tradotta.inspect}".verde_lime
          puts
        end

        private

          def errore!(classe, messaggio, file, linea, riga, posizione)
            raise classe.new(messaggio: messaggio, file: file, linea: linea, riga: riga, posizione: posizione)
          end

          def controlla_stringa_singola(file, linea, riga, posizione_commento, posizione_stringa_singola, posizione_stringa_doppia)
            if posizione_stringa_singola != nil and posizione_stringa_singola < posizione_commento
              errore! Errore::NonSupportato, "Le stringhe con singolo apice non sono supportate.", file, linea, riga, posizione_stringa_singola
            end
          end

          def controlla_stringa_doppia(file, linea, riga, posizione_commento, posizione_stringa_singola, posizione_stringa_doppia)
            if posizione_stringa_doppia  != nil and posizione_stringa_doppia  < posizione_commento
              prossimo_posizione_stringa_doppia = linea[posizione_stringa_doppia + 1..].index %{"}
              if prossimo_indice_stringa_doppia.nil?
                errore! Errore::IndividuazioneStringa, "Non è stato possibile trovare la terminazione della stringa.", file, linea, riga, posizione_stringa_doppia
              end
            end
          end

          def traduci_pezzo(pezzo)
            pezzo.gsub! /([\s]+)e([\s]+)/,              "\\1and\\2"
            pezzo.gsub! /inizia([\s]+)/,                "begin\\1"
            pezzo.gsub! /esci([\s]+)/,                  "break\\1"
            pezzo.gsub! /considera([\s]+)/,             "case\\1"
            pezzo.gsub! /classe([\s]+)([A-Z][\w]*)/,    "class\\1\\2"
            pezzo.gsub! /definisci([\s]+)([\w]+)/,      "def\\1\\2"
            pezzo.gsub! /definito\?([\s]+)([\w]+)/,     "defined?\\1\\2"
            pezzo.gsub! /definita\?([\s]+)([\w]+)/,     "defined?\\1\\2"
            pezzo.gsub! /([\s]+)esegui([\s]+)/,         "\\1do\\2"
            pezzo.gsub! /altrimenti([\s]+)/,            "else\\1"
            pezzo.gsub! /altrimenti_se([\s]+)/,         "elsif\\1"
            pezzo.gsub! /end([\s]+)/,                   "end\\1"
            pezzo.gsub! /end$/,                         "end"
            pezzo.gsub! /assicura([\s]+)/,              "ensure\\1"
            pezzo.gsub! /no([\s]+)/,                    "false\\1"
            pezzo.gsub! /falso([\s]+)/,                 "false\\1"
            pezzo.gsub! /per([\s]+)/,                   "for\\1"
            pezzo.gsub! /se([\s]+)/,                    "if\\1"
            pezzo.gsub! /modulo([\s]+)([A-Z][\w]*)/,    "module\\1\\2"
            pezzo.gsub! /prossimo([\s]+)/,              "next\\1"
            pezzo.gsub! /prossima([\s]+)/,              "next\\1"
            pezzo.gsub! /nullo([\s]+)/,                 "nil\\1"
            pezzo.gsub! /nulla([\s]+)/,                 "nil\\1"
            pezzo.gsub! /non([\s]+)/,                   "not\\1"
            pezzo.gsub! /([\s]+)o([\s]+)/,              "\\1or\\2"
            pezzo.gsub! /riesegui([\s]+)/,              "redo\\1"
            pezzo.gsub! /recupera([\s]+)/,              "rescue\\1"
            pezzo.gsub! /riprova([\s]+)/,               "retry\\1"
            pezzo.gsub! /ritorna([\s]+)/,               "return\\1"
            pezzo.gsub! /istanza/,                      "self"
            pezzo.gsub! /se_stesso/,                    "self"
            pezzo.gsub! /se_stessa/,                    "self"
            pezzo.gsub! /allora([\s]+)/,                "then\\1"
            pezzo.gsub! /si([\s]+)/,                    "true\\1"
            pezzo.gsub! /vero([\s]+)/,                  "true\\1"
            pezzo.gsub! /a_meno_che([\s]+)/,            "unless\\1"
            pezzo.gsub! /finché([\s]+)/,                "until\\1"
            pezzo.gsub! /quando([\s]+)/,                "when\\1"
            pezzo.gsub! /mentre([\s]+)/,                "while\\1"
            pezzo.gsub! /rilascia([\s]+)/,              "yield\\1"
            pezzo
          end

      end

    end
  end
end