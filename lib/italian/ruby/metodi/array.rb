# frozen_string_literal: true

class Array

  ##
  # Determina se una lista non è nullo e non è vuoto.
  def esiste?
    !nil? && !empty?
  end

  ##
  # Determina se una lista non include un dato elemento.
  def non_include?(*args)
    !include? *args
  end

  ##
  # Esegue il metodo specificato con gli argomenti specificati
  # per ogni elemento della lista.
  def pizzica(method_name, *method_args)
    self.map do |element|
      if element.respond_to? method_name
        element.send method_name, *method_args
      elsif element.is_a? Hash
        element[method_name]
      else
        raise ArgumentError, "Array elements do not respond to #{method_name}."
      end
    end
  end

  ##
  # Converte tutti gli elementi della lista in simboli, sostituendo
  # la lista originale.
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

  ##
  # Converte tutti gli elementi della lista in simboli, creando
  # una nuova lista.
  def simbolizza
    self.map do |element|
      if element.is_a? Hash
        element.simbolizza
      else
        element
      end
    end
  end

  ##
  # Mappa e rimuove duplicati in un unico metodo.
  def mappa_e_rimuovi_duplicati(&block)
    self.map.with_index(&block).uniq
  end

  ##
  # Mappa e compatta in un unico metodo.
  def mappa_e_compatta(&block)
    self.map.with_index(&block).compact
  end

  ##
  # Mappa e appiattisce in un unico metodo.
  def mappa_e_appiattisci(&block)
    self.map.with_index(&block).flatten
  end

  ##
  # Converte la lista in una mappa.
  def in_mappa(&block)
    if block_given?
      self.map(&block).to_h
    else
      self.to_h
    end
  end

  ##
  # Restituisce il secondo elemento della lista.
  def secondo
    self[1]
  end

  ##
  # Restituisce la lista togliendo gli ultimi n elementi.
  def tronca(n = 0)
    self[0..(-1 - n)]
  end

  ##
  # Restituisce la lista saltando il primo elemento.
  def salta_il_primo
    self.drop 1
  end

end
