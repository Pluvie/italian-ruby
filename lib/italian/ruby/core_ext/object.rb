##
# Core Ext - Oggetti
#
# Alias di metodi della classe Object.

class Object
  class << self
    alias_method      :nuovo,               :new
    alias_method      :nuova,               :new
  end

  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :risponde_a?          :respond_to?

  def esiste?
    !nil?
  end

  private

    def inizializzatore(*args, &block)
    end

    def initialize(*args, &block)
      inizializzatore *args, &block
    end

end

Oggetto = Object