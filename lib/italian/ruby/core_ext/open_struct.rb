##
# Core Ext - OpenStruct
#
# Alias di metodi della classe OpenStruct.

class OpenStruct
  alias         :in_mappa                   :to_h
end

Archivio = OpenStruct