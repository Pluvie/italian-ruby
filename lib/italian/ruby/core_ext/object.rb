##
# Core Ext - Oggetti
#
# Alias di metodi della classe Object.

class Object
  class << self
    alias             :nuovo                :new
    alias             :nuova                :new
    alias             :ottieni_costante     :const_get
    alias             :in_stringa           :to_s
  end

  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :risponde_a?          :respond_to?
  alias               :manda                :send
  alias               :ispeziona            :inspect
  alias               :è_un?                :is_a?
  alias               :è_una?               :is_a?
  alias               :valuta_in_istanza    :instance_eval
  alias               :esegui_in_istanza    :instance_exec
  alias               :clona                :clone

  def esiste?
    !nil?
  end
  alias       :specificato?       :esiste?
  alias       :specificata?       :esiste?

  def non_esiste?
    !esiste?
  end
  alias       :non_specificato?   :non_esiste?
  alias       :non_specificata?   :non_esiste?

  def non_è_un?(arg)
    !is_a? arg
  end
  alias             :non_è_una?             :non_è_un?

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

  def in_json
    to_json
  end

  private

    def inizializzatore(*args, **options, &block)
    end

    def initialize(*args, **options, &block)
      inizializzatore *args, **options, &block
    end

    def istanza
      self
    end
    alias           :se_stesso              :istanza
    alias           :se_stessa              :istanza

end

Oggetto = Object