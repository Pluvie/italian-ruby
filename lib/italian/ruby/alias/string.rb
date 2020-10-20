# frozen_string_literal: true

class String
  alias       :congela                  :freeze
  alias       :caratteri                :chars
  alias       :prima_maiuscola          :capitalize
  alias       :in_simbolo               :to_sym
  alias       :in_stringa               :to_s
  alias       :in_numero                :to_i
  alias       :in_intero                :to_i
  alias       :in_decimale              :to_f
  alias       :dividi                   :split
  alias       :maiuscola                :upcase
  alias       :maiuscolo                :upcase
  alias       :minuscola                :downcase
  alias       :minuscolo                :downcase
  alias       :indice                   :index
  alias       :combacia?                :match?
  alias       :inizia_con?              :start_with?
  alias       :finisce_con?             :end_with?
  alias       :partiziona               :partition
  alias       :partiziona_dalla_fine    :rpartition
  alias       :lunghezza                :size
  alias       :giustifica_a_sinistra    :ljust
  alias       :giustifica_a_destra      :rjust
  alias       :rimpiazza                :gsub
  alias       :rimpiazza!               :gsub!
  alias       :spoglia                  :strip
  alias       :conteggio                :count
  alias       :conteggia                :count
  alias       :codifica                 :encoding
  alias       :codifica_in              :encode
  alias       :codifica_valida?         :valid_encoding?
  alias       :forza_codifica_a         :force_encoding

  alias       :specificato?             :esiste?
  alias       :specificata?             :esiste?
end

Stringa = String
