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

end
