# frozen_string_literal: true
require "ostruct"

class OpenStruct

  ##
  # Converte la mappa aperta in una mappa normale.
  def in_mappa(*args)
    hash = to_h *args
    hash.in_mappa do |key, value|
      if value.is_a? OpenStruct
        [ key, value.to_h ]
      else
        [ key, value ]
      end
    end
  end

end
