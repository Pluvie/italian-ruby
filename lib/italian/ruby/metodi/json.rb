# frozen_string_literal: true

module JSON

  ##
  # Processa la stringa come JSON.
  def self.processa(*args)
    self.parse(*args)
  end

  ##
  # Converte l'oggetto in una stringa JSON.
  def self.in_stringa(*args)
    self.dump(*args)
  end

end
