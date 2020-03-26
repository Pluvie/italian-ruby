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
  alias         :trasforma_chiavi     :transform_keys
  alias         :trasforma_valori     :transform_values

  def esiste?
    !nil? && !empty?
  end
end

Mappa = Hash