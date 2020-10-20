# frozen_string_literal: true

class Hash

  ##
  # Determina se una mappa non è nulla e non è vuota.
  def esiste?
    !nil? && !empty?
  end

  ##
  # Determina se una mappa è nulla o è vuota.
  def non_esiste?
    !esiste?
  end

  ##
  # Determina se una mappa non ha una data chiave.
  def non_ha_chiave?(key)
    !has_key? key
  end

  ##
  # Restituisce la mappa con le chiavi convertite in simbolo.
  # Viene sostituita la mappa esistente.
  def simbolizza!
    keys.each do |key|
      value = delete key
      value.simbolizza! if value.is_a? Hash or value.is_a? Array
      self[key.to_sym] = value
    end
    self
  end

  ##
  # Restituisce la mappa con le chiavi convertite in simbolo.
  # Viene creata una nuova mappa.
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

  ##
  # Espone le chiavi passate in una nuova mappa.
  def esponi(*keys)
    self.select { |key, value| key.in? keys }
  end

end
