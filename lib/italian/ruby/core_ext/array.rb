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
  alias         :appiattisci!         :flatten!
  alias         :compatta             :compact
  alias         :compatta!            :compact!
  alias         :valori_univoci       :uniq
  alias         :rimuovi_duplicati    :uniq
  alias         :valori_univoci!      :uniq!
  alias         :rimuovi_duplicati!   :uniq!
  alias         :conteggio            :count
  alias         :conteggia            :count
  alias         :lunghezza            :count
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
  alias         :ordina               :sort
  alias         :ordina!              :sort!
  alias         :ordina_per           :sort_by
  alias         :ordina_per!          :sort_by!
  alias         :raggruppa_per        :group_by
  alias         :indice               :index
  alias         :indice_da_destra     :rindex
  alias         :indice_dal_fondo     :rindex
  alias         :togli_i_primi        :drop
  alias         :togli_le_prime       :drop
  alias         :aggiungi             :push
  alias         :togli                :pop
  alias         :riduci               :inject
  alias         :inietta              :inject
  alias         :alla_posizione       :at
  alias         :somma                :sum
  alias         :rovescia             :reverse
  alias         :inverti              :reverse
  alias         :lista                :entries

  def esiste?
    !nil? && !empty?
  end

  def non_include?(*args)
    !include? *args
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

  def simbolizza!
    self.map! do |element|
      if element.is_a? Hash
        element.simbolizza!
      else
        element
      end
    end
    self
  end

  def simbolizza
    self.map do |element|
      if element.is_a? Hash
        element.simbolizza
      else
        element
      end
    end
  end

  def mappa_e_rimuovi_duplicati(&block)
    self.map.with_index(&block).uniq
  end

  def mappa_e_compatta(&block)
    self.map.with_index(&block).compact
  end

  def mappa_e_appiattisci(&block)
    self.map.with_index(&block).flatten
  end

  def in_mappa(&block)
    if block_given?
      self.map(&block).to_h
    else
      self.to_h
    end
  end

  def secondo
    self[1]
  end
  alias   :seconda    :secondo
end

Lista = Array