##
# Core Ext - Hash
#
# Alias di metodi della classe Hash.

class Hash
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :chiavi               :keys
  alias         :valori               :values
  alias         :mappa                :map
  alias         :vuoto?               :empty?
  alias         :vuota?               :empty?
  alias         :ha_chiave?           :has_key?
  alias         :ottieni              :fetch
  alias         :prendi               :fetch
  alias         :deposita             :store
  alias         :scava                :dig
  alias         :fondi                :merge
  alias         :fondi!               :merge!
  alias         :trasforma_chiavi     :transform_keys
  alias         :trasforma_valori     :transform_values
  alias         :seleziona            :select
  alias         :seleziona!           :select!
  alias         :scarta               :reject
  alias         :scarta!              :reject!
  alias         :rimuovi              :delete
  alias         :congela              :freeze
  alias         :tutti?               :all?
  alias         :tutte?               :all?
  alias         :alcuni?              :any?
  alias         :alcune?              :any?
  alias         :almeno_uno?          :any?
  alias         :almeno_una?          :any?
  alias         :nessuno?             :none?
  alias         :nessuna?             :none?
  alias         :in_mappa             :to_h
  alias         :in_lista             :to_a
  alias         :inverti              :invert

  def esiste?
    !nil? && !empty?
  end
  alias         :specificato?         :esiste?
  alias         :specificata?         :esiste?

  def non_esiste?
    !esiste?
  end
  alias         :non_specificato?     :non_esiste?
  alias         :non_specificata?     :non_esiste?

  def non_ha_chiave?(key)
    !has_key? key
  end

  def simbolizza!
    keys.each do |key|
      value = delete key
      value.simbolizza! if value.is_a? Hash or value.is_a? Array
      self[key.to_sym] = value
    end
    self
  end

  def simbolizza
    copy = Hash.new
    self.each do |key, value|
      if value.is_a? Hash or value.is_a? Array
        copy[key.to_sym] = value.simbolizza
      else
        copy[key.to_sym] = value
      end
    end
    copy
  end
end

Mappa = Hash