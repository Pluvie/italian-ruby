# frozen_string_literal: true

class Object

  ##
  # Assegna il valore chiamando il metodo passato come
  # un metodo di assegnamento.
  def assegna(method, value)
    self.send "#{method}=", value
  end

  ##
  # Determina se l'oggetto non è nullo.
  def esiste?
    !nil?
  end

  ##
  # Determina se l'oggetto è nullo.
  def non_esiste?
    !esiste?
  end

  ##
  # Determina se l'oggetto non è istanza di una data classe.
  def non_è_un?(arg)
    !is_a? arg
  end

  ##
  # Determina se l'oggetto non risponde a un dato metodo.
  def non_risponde_a?(method)
    !respond_to? method
  end

  ##
  # Determina se l'oggetto è incluso in una lista.
  def in?(array)
    raise ArgumentError.new("Argument passed to `in?` must respond to `include?`") unless
      array.respond_to? :include?
    array.include? self
  end

  ##
  # Determina se l'oggetto non è incluso in una lista.
  def non_in?(array)
    !in? array
  end

  ##
  # Converte l'oggetto in JSON.
  def in_json
    to_json
  end

  private

    ##
    # Metodo per riferire l'oggetto stesso.
    def istanza
      self
    end

end
