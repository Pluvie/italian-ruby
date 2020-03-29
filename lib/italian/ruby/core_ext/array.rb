##
# Core Ext - Array
#
# Alias di metodi della classe Array.

class Array
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :mappa                :map
  alias         :vuoto?               :empty?
  alias         :vuota?               :empty?
  alias         :primo                :first
  alias         :prima                :first
  alias         :ultimo               :last
  alias         :ultima               :last
  alias         :uno_a_caso           :sample
  alias         :una_a_caso           :sample
  alias         :prendine_a_caso      :sample
  alias         :unisci               :join
  alias         :appiattisci          :flatten
  alias         :compatta             :compact
  alias         :conteggio            :count
  alias         :tutti?               :all?
  alias         :tutte?               :all?
  alias         :alcuni?              :any?
  alias         :alcune?              :any?
  alias         :nessuno?             :none?
  alias         :nessuna?             :none?

  def esiste?
    !nil? && !empty?
  end
end

Lista = Array