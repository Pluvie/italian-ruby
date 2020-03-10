alias           :stampa               :puts

## Oggetti
class Object
  alias         :nullo?               :nil?
  alias         :nulla?               :nil?

  def presente?
    !nil?
  end

  class << self
    alias_method :inizializzatore,    :initialize
    alias_method :nuovo,              :new
    alias_method :nuova,              :new
  end
end
Oggetto = Object

## Liste
class Array
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :mappa                :map
  alias         :vuoto?               :empty?

  def presente?
    !nil? && !empty?
  end
end
Lista = Array

## Mappe
class Hash
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :chiavi               :keys
  alias         :valori               :values
  alias         :mappa                :map

  def presente?
    !nil? && !empty?
  end
end
Mappa = Hash