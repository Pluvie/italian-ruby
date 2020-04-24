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
  alias         :primi                :first
  alias         :prime                :first
  alias         :ultimo               :last
  alias         :ultima               :last
  alias         :ultimi               :last
  alias         :ultime               :last
  alias         :a_caso               :sample
  alias         :uno_a_caso           :sample
  alias         :una_a_caso           :sample
  alias         :prendine_a_caso      :sample
  alias         :mescola              :shuffle
  alias         :unisci               :join
  alias         :appiattisci          :flatten
  alias         :compatta             :compact
  alias         :valori_univoci       :uniq
  alias         :rimuovi_duplicati    :uniq
  alias         :conteggio            :count
  alias         :conteggia            :count
  alias         :tutti?               :all?
  alias         :tutte?               :all?
  alias         :alcuni?              :any?
  alias         :alcune?              :any?
  alias         :almeno_uno?          :any?
  alias         :almeno_una?          :any?
  alias         :nessuno?             :none?
  alias         :nessuna?             :none?
  alias         :congela              :freeze
  alias         :seleziona            :select
  alias         :seleziona!           :select!
  alias         :scarta               :reject
  alias         :scarta!              :reject!
  alias         :trova                :find
  alias         :cerniera             :zip
  alias         :in_mappa             :to_h
  alias         :ordina               :sort
  alias         :ordina_per           :sort_by

  def esiste?
    !nil? && !empty?
  end

  def pizzica(method_name)
    self.map do |element|
      if element.respond_to? method_name
        element.send method_name
      elsif element.is_a? Hash
        element[method_name]
      else
        raise ArgumentError, "Array elements do not respond to #{method_name}."
      end
    end
  end
end

Lista = Array