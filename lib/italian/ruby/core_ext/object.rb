##
# Core Ext - Oggetti
#
# Alias di metodi della classe Object.

class Object
  class << self
    alias             :nuovo                :new
    alias             :nuova                :new
  end

  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :risponde_a?          :respond_to?
  alias               :manda                :send
  alias               :ispeziona            :inspect

  def esiste?
    !nil?
  end

  def non_risponde_a?(method)
    !respond_to? method
  end

  def in?(array)
    raise ArgumentError.new("Argument passed to `in?` must respond to `include?`") unless
      array.respond_to? :include?
    array.include? self
  end

  def non_in?(array)
    !in? array
  end

  private

    def inizializzatore(*args, **options, &block)
    end

    def initialize(*args, **options, &block)
      inizializzatore *args, **options, &block
    end

end

Oggetto = Object