##
# Core Ext - String
#
# Alias di metodi della classe String.

class String
  alias       :congela                  :freeze
  alias       :prima_maiuscola          :capitalize
  alias       :in_simbolo               :to_sym
  alias       :in_stringa               :to_s
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

  def esiste?
    !nil? and self != ""
  end
  alias       :specificato?             :esiste?
  alias       :specificata?             :esiste?
end

Stringa = String