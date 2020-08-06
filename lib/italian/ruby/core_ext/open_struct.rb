require "ostruct"

##
# Core Ext - OpenStruct
#
# Alias di metodi della classe OpenStruct.

class OpenStruct
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

Archivio = OpenStruct
