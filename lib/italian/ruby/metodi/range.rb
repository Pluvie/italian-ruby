# frozen_string_literal: true

class Range

  ##
  # Determina se un intervallo non include un valore.
  def non_include?(*args)
    !include? *args
  end

end
