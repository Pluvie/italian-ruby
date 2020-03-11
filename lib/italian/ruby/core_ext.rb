original_verbosity = $VERBOSE
$VERBOSE = nil

alias           :stampa               :puts
alias           :cicla                :loop

## Oggetti
class Object
  class << self
    alias_method :nuovo,              :new
    alias_method :nuova,              :new
  end

  alias         :nullo?               :nil?
  alias         :nulla?               :nil?

  def presente?
    !nil?
  end

  private

    def inizializzatore(*args, &block)
    end

    def initialize(*args, &block)
      inizializzatore
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

$VERBOSE = original_verbosity