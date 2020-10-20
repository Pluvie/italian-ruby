# frozen_string_literal: true

##
# Parte di una linea che contiene codice da tradurre.
module Italian
  module Ruby
    class Traduttore
      class Pezzo

        attr_accessor :contenuto

        def initialize(contenuto, da_non_tradurre = false)
          @contenuto        = contenuto
          @da_non_tradurre  = da_non_tradurre
        end

        def traduci
          return @contenuto if @da_non_tradurre
          return @contenuto if vuoto_o_nullo?
          return @contenuto if è_un_commento?
          return @contenuto if è_una_stringa?

          traduci_in_ruby
        end

        private

          ##
          # Determina se il pezzo è vuoto o nullo.
          def vuoto_o_nullo?
            @contenuto.nil? or
            @contenuto.strip == ""
          end

          ##
          # Determina se il pezzo da tradurre rappresenta un commento.
          def è_un_commento?
            @contenuto.start_with? "#"
          end

          ##
          # Determina se il pezzo da tradurre rappresenta una stringa.
          def è_una_stringa?
            @contenuto.start_with? "\"" or
            @contenuto.start_with? "'"  or
            @contenuto.start_with? "%{"
          end

          ##
          # Traduce in Ruby.
          def traduci_in_ruby
            contenuto_tradotto = @contenuto.clone

            contenuto_tradotto.gsub! /(\b)e(\b)/,                      "\\1and\\2"
            contenuto_tradotto.gsub! /(\b)inizia(\b)/,                 "\\1begin\\2"
            contenuto_tradotto.gsub! /(\b)blocco_dato\?(\b)/,          "\\1block_given?\\2"
            contenuto_tradotto.gsub! /(\b)esci(\b)/,                   "\\1break\\2"
            contenuto_tradotto.gsub! /(\b)considera(\b)/,              "\\1case\\2"
            contenuto_tradotto.gsub! /(\b)classe([\s]+[A-Z][\w]*)/,    "\\1class\\2"
            contenuto_tradotto.gsub! /(\b)classe([\s]+)(<<)([\s]+)/,   "\\1class\\2\\3\\4"
            contenuto_tradotto.gsub! /(\b)definisci([\s]+[^\s]+)/,     "\\1def\\2"
            contenuto_tradotto.gsub! /(\b)definito\?([\s]+[^\s]+)/,    "\\1defined?\\2"
            contenuto_tradotto.gsub! /(\b)definita\?([\s]+[^\s]+)/,    "\\1defined?\\2"
            contenuto_tradotto.gsub! /(\b)inizializzatore(\b)/,        "\\1initialize\\2"
            contenuto_tradotto.gsub! /(\b)esegui(\b)/,                 "\\1do\\2"
            contenuto_tradotto.gsub! /(\b)altrimenti(\b)/,             "\\1else\\2"
            contenuto_tradotto.gsub! /(\b)altrimenti_se(\b)/,          "\\1elsif\\2"
            contenuto_tradotto.gsub! /(\b)fine(\b)/,                   "\\1end\\2"
            contenuto_tradotto.gsub! /(\b)assicura(\b)/,               "\\1ensure\\2"
            contenuto_tradotto.gsub! /(\b)estendi([\s]+[A-Z][\w]*)/,   "\\1extend\\2"
            contenuto_tradotto.gsub! /(\b)no(\b)/,                     "\\1false\\2"
            contenuto_tradotto.gsub! /(\b)falso(\b)/,                  "\\1false\\2"
            contenuto_tradotto.gsub! /(\b)per(\b)/,                    "\\1for\\2"
            contenuto_tradotto.gsub! /(\b)se(\b)/,                     "\\1if\\2"
            contenuto_tradotto.gsub! /(\b)includi([\s]+[A-Z][\w]*)/,   "\\1include\\2"
            contenuto_tradotto.gsub! /(\b)modulo([\s]+[A-Z][\w]*)/,    "\\1module\\2"
            contenuto_tradotto.gsub! /(\b)prossimo(\b)/,               "\\1next\\2"
            contenuto_tradotto.gsub! /(\b)prossima(\b)/,               "\\1next\\2"
            contenuto_tradotto.gsub! /(\b)nullo(\b)/,                  "\\1nil\\2"
            contenuto_tradotto.gsub! /(\b)nulla(\b)/,                  "\\1nil\\2"
            contenuto_tradotto.gsub! /(\b)non(\b)/,                    "\\1not\\2"
            contenuto_tradotto.gsub! /(\b)o(\b)/,                      "\\1or\\2"
            contenuto_tradotto.gsub! /(\b)preponi([\s]+[A-Z][\w]*)/,   "\\1prepend\\2"
            contenuto_tradotto.gsub! /(\b)riesegui(\b)/,               "\\1redo\\2"
            contenuto_tradotto.gsub! /(\b)recupera(\b)/,               "\\1rescue\\2"
            contenuto_tradotto.gsub! /(\b)riprova(\b)/,                "\\1retry\\2"
            contenuto_tradotto.gsub! /(\b)ritorna(\b)/,                "\\1return\\2"
            contenuto_tradotto.gsub! /(\b)istanza/,                    "\\1self"
            contenuto_tradotto.gsub! /(\b)se_stesso/,                  "\\1self"
            contenuto_tradotto.gsub! /(\b)se_stessa/,                  "\\1self"
            contenuto_tradotto.gsub! /(\b)allora(\b)/,                 "\\1then\\2"
            contenuto_tradotto.gsub! /(\b)si(\b)/,                     "\\1true\\2"
            contenuto_tradotto.gsub! /(\b)vero(\b)/,                   "\\1true\\2"
            contenuto_tradotto.gsub! /(\b)a_meno_che(\b)/,             "\\1unless\\2"
            contenuto_tradotto.gsub! /(\b)finché(\b)/,                 "\\1until\\2"
            contenuto_tradotto.gsub! /(\b)quando(\b)/,                 "\\1when\\2"
            contenuto_tradotto.gsub! /(\b)mentre(\b)/,                 "\\1while\\2"
            contenuto_tradotto.gsub! /(\b)rilascia(\b)/,               "\\1yield\\2"

            contenuto_tradotto
          end

      end
    end
  end
end
