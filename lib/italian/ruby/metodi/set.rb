# frozen_string_literal: true

class Set


  ##
  # Congela in profondità l'insieme.
  def congela_in_profondità
    self.each do |element|
      next unless element.respond_to? :congela_in_profondità
      element.congela_in_profondità
    end
    self.freeze
    self
  end

  ##
  # Converte l'insieme in una mappa.
  def in_mappa(&block)
    return self.map(&block).to_h if block_given?
    raise ArgumentError, "must pass a block in order to convert a Set into a Hash"
  end

end
