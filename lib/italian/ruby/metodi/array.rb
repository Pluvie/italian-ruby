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
  # Divide la lista in n pacchetti in modo che ogni pacchetto abbia
  # circa lo stesso numero di elementi.
  def in_pacchetti_equi da: 25
    conteggio = self.count

    if conteggio < da
      avanzamento = da.in_decimale / conteggio
      indice = 0

      self.each.with_index do |elemento, indice_elemento|
        pacchetto = [ elemento ]
        indice += avanzamento
        indice = da if indice_elemento == conteggio - 1
        yield pacchetto, indice_elemento + 1, conteggio if block_given?
      end
    else
      avanzamento = conteggio / da.in_decimale
      elementi_presi = 0
      contatore = 0
      indice = 0

      while contatore < da
        elementi_da_prendere = (indice + avanzamento).round - 1
        pacchetto = self[elementi_presi..elementi_da_prendere]
        elementi_presi = elementi_da_prendere + 1
        indice += avanzamento
        contatore += 1
        yield pacchetto, elementi_presi, conteggio if block_given?
      end
    end

    self
  end

  ##
  # Pacchetti equi da 100.
  def in_pacchetti_percentuali &blocco
    in_pacchetti_equi da: 100, &blocco
  end

  ##
  # Esegue i metodi specificati per ogni elemento della lista.
  def campiona(*method_names)
    self.map do |element|
      method_names.map do |method_name|
        if element.respond_to? method_name
          element.send method_name
        elsif element.is_a? Hash
          element[method_name]
        else
          raise ArgumentError, "Array elements do not respond to #{method_name}."
        end
      end
    end
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
      if element.is_a? Hash or element.is_a? Array
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
  # Congela in profondità la lista.
  def congela_in_profondità
    self.each do |element|
      next unless element.respond_to? :congela_in_profondità
      element.congela_in_profondità
    end
    self.freeze
    self
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
  def tronca(n = 1)
    self[0..(-1 - n)]
  end

  ##
  # Restituisce la lista saltando il primo elemento.
  def salta_il_primo
    self.drop 1
  end

  ##
  # Rappresentazione per stampa.
  def _stampa(i = 0)
    return "[]" if empty?
    spazi = i.times.map { " " }.join
    spazi_valori = (i + 2).times.map { " " }.join
    [ "[",
      *self.map do |e|
        "#{spazi_valori}#{e._stampa(i + 2)},"
      end,
      "#{spazi}]"
    ].join("\r\n")
  end

end
