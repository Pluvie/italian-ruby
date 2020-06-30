##
# Core Ext - String
#
# Alias di metodi della classe String.

class String
  alias       :congela                  :freeze
  alias       :prima_maiuscola          :capitalize
  alias       :in_simbolo               :to_sym
  alias       :in_stringa               :to_s
  alias       :in_numero                :to_i
  alias       :dividi                   :split
  alias       :maiuscola                :upcase
  alias       :maiuscolo                :upcase
  alias       :minuscola                :downcase
  alias       :minuscolo                :downcase
  alias       :combacia?                :match?
  alias       :inizia_con?              :start_with?
  alias       :finisce_con?             :end_with?
  alias       :partiziona               :partition
  alias       :partiziona_dalla_fine    :rpartition
  alias       :lunghezza                :size
  alias       :giustifica_a_sinistra    :ljust
  alias       :giustifica_a_destra      :rjust
  alias       :rimpiazza                :gsub
  alias       :spoglia                  :strip
  alias       :conteggio                :count
  alias       :conteggia                :count
  alias       :codifica                 :encoding
  alias       :codifica_in              :encode
  alias       :codifica_valida?         :valid_encoding?
  alias       :forza_codifica_a         :force_encoding

  def esiste?
    !nil? and self != ""
  end
  alias       :specificato?             :esiste?
  alias       :specificata?             :esiste?

  def non_include?(*args)
    !include? *args
  end

  def non_inizia_con?(*args)
    !inizia_con? *args
  end

  def non_finisce_con?(*args)
    !finisce_con? *args
  end

  def in_data
    return unless defined? Date
    Date.parse self
  end
end

Stringa = String