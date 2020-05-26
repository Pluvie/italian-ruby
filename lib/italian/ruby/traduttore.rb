# frozen_string_literal: true
require           "rainbow"
require_relative  "utils/debug"
require_relative  "errore"

module Italian
  module Ruby
    class Traduttore

      STAMPA_DETTAGLI_TRADUZIONE = false

      class << self

        def traduci(file = nil, &block)
          if not file.nil?
            codice_tradotto = File.readlines(file).map.with_index do |linea, riga|
              traduci_linea file, linea, riga
            end
            codice_tradotto.join
          else
            if block_given?
              begin
                block.call
              rescue StandardError => errore
                Italian::Ruby::Errore.new([ errore.message, errore.backtrace ].join("\n"), "-", 0, 0).stampa
              end
            end
          end
        end

        def traduci_linea(file, linea, riga)
          puts "Traduco linea  [#{riga}]: #{linea.inspect}".magenta if STAMPA_DETTAGLI_TRADUZIONE
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

          if posizione_commento < posizione_stringa_doppia
            pezzi_da_tradurre = [
              linea[0..posizione_commento],
              linea[posizione_commento + 1..]
            ]
          elsif posizione_stringa_doppia < posizione_commento
            pezzi_da_tradurre = linea.scan( /([^"]*)("[^"]*")([^"]*)/ ).flatten
          else
            pezzi_da_tradurre = [ linea ]
          end

          debug pezzi_da_tradurre if STAMPA_DETTAGLI_TRADUZIONE
          linea_tradotta = pezzi_da_tradurre.map { |pezzo| traduci_pezzo pezzo }.join

          if STAMPA_DETTAGLI_TRADUZIONE
            puts "Linea tradotta [#{riga}]: #{linea_tradotta.inspect}".verde_lime
            puts
          end
          linea_tradotta
        end

        private

          def controlla_stringa_singola(file, linea, riga, posizione_commento, posizione_stringa_singola, posizione_stringa_doppia)
            if posizione_stringa_singola < posizione_commento and posizione_stringa_singola < posizione_stringa_doppia
              Italian::Ruby::Errore::NonSupportato.new(
                "Le stringhe con singolo apice non sono supportate.",
                file, riga, posizione_stringa_singola).stampa
            end
          end

          def controlla_stringa_doppia(file, linea, riga, posizione_commento, posizione_stringa_singola, posizione_stringa_doppia)
            return if posizione_commento <= posizione_stringa_doppia
          
            prossima_posizione_stringa_doppia = linea[posizione_stringa_doppia + 1..].index %{"}
            if prossima_posizione_stringa_doppia.nil?
              Italian::Ruby::Errore::IndividuazioneStringa.new(
                "Non è stato possibile trovare la terminazione della stringa.",
                file, riga, posizione_stringa_doppia).stampa
            end
          end

          def traduci_pezzo(pezzo)
            return pezzo if pezzo.nil? or pezzo.length == 0
            return pezzo if pezzo.start_with? %{#}
            return pezzo if pezzo.start_with? %{"}

            pezzo.gsub! /(\b)e(\b)/,                      "\\1and\\2"
            pezzo.gsub! /(\b)inizia(\b)/,                 "\\1begin\\2"
            pezzo.gsub! /(\b)blocco_dato\?(\b)/,          "\\1block_given?\\2"
            pezzo.gsub! /(\b)esci(\b)/,                   "\\1break\\2"
            pezzo.gsub! /(\b)considera(\b)/,              "\\1case\\2"
            pezzo.gsub! /(\b)classe([\s]+[A-Z][\w]*)/,    "\\1class\\2"
            pezzo.gsub! /(\b)classe([\s]+)(<<)([\s]+)/,   "\\1class\\2\\3\\4"
            pezzo.gsub! /(\b)definisci([\s]+[^\s]+)/,     "\\1def\\2"
            pezzo.gsub! /(\b)definito\?([\s]+[^\s]+)/,    "\\1defined?\\2"
            pezzo.gsub! /(\b)definita\?([\s]+[^\s]+)/,    "\\1defined?\\2"
            pezzo.gsub! /(\b)esegui(\b)/,                 "\\1do\\2"
            pezzo.gsub! /(\b)altrimenti(\b)/,             "\\1else\\2"
            pezzo.gsub! /(\b)altrimenti_se(\b)/,          "\\1elsif\\2"
            pezzo.gsub! /(\b)fine(\b)/,                   "\\1end\\2"
            pezzo.gsub! /(\b)assicura(\b)/,               "\\1ensure\\2"
            pezzo.gsub! /(\b)estendi([\s]+[A-Z][\w]*)/,   "\\1extend\\2"
            pezzo.gsub! /(\b)no(\b)/,                     "\\1false\\2"
            pezzo.gsub! /(\b)falso(\b)/,                  "\\1false\\2"
            pezzo.gsub! /(\b)per(\b)/,                    "\\1for\\2"
            pezzo.gsub! /(\b)se(\b)/,                     "\\1if\\2"
            pezzo.gsub! /(\b)includi([\s]+[A-Z][\w]*)/,   "\\1include\\2"
            pezzo.gsub! /(\b)modulo([\s]+[A-Z][\w]*)/,    "\\1module\\2"
            pezzo.gsub! /(\b)prossimo(\b)/,               "\\1next\\2"
            pezzo.gsub! /(\b)prossima(\b)/,               "\\1next\\2"
            pezzo.gsub! /(\b)nullo(\b)/,                  "\\1nil\\2"
            pezzo.gsub! /(\b)nulla(\b)/,                  "\\1nil\\2"
            pezzo.gsub! /(\b)non(\b)/,                    "\\1not\\2"
            pezzo.gsub! /(\b)o(\b)/,                      "\\1or\\2"
            pezzo.gsub! /(\b)preponi([\s]+[A-Z][\w]*)/,   "\\1prepend\\2"
            pezzo.gsub! /(\b)riesegui(\b)/,               "\\1redo\\2"
            pezzo.gsub! /(\b)recupera(\b)/,               "\\1rescue\\2"
            pezzo.gsub! /(\b)riprova(\b)/,                "\\1retry\\2"
            pezzo.gsub! /(\b)ritorna(\b)/,                "\\1return\\2"
            pezzo.gsub! /(\b)istanza/,                    "\\1self"
            pezzo.gsub! /(\b)se_stesso/,                  "\\1self"
            pezzo.gsub! /(\b)se_stessa/,                  "\\1self"
            pezzo.gsub! /(\b)allora(\b)/,                 "\\1then\\2"
            pezzo.gsub! /(\b)si(\b)/,                     "\\1true\\2"
            pezzo.gsub! /(\b)vero(\b)/,                   "\\1true\\2"
            pezzo.gsub! /(\b)a_meno_che(\b)/,             "\\1unless\\2"
            pezzo.gsub! /(\b)finché(\b)/,                 "\\1until\\2"
            pezzo.gsub! /(\b)quando(\b)/,                 "\\1when\\2"
            pezzo.gsub! /(\b)mentre(\b)/,                 "\\1while\\2"
            pezzo.gsub! /(\b)rilascia(\b)/,               "\\1yield\\2"
            pezzo
          end

      end

    end
  end
end