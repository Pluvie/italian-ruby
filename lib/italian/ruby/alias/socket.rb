# frozen_string_literal: true
require "socket"

class Socket

  alias   :scrivi       :write
  alias   :leggi        :read
  alias   :leggi_linea  :readline
  alias   :chiudi       :close

end

class UNIXSocket

  alias   :scrivi       :write
  alias   :leggi        :read
  alias   :ricevi       :recv
  alias   :leggi_linea  :readline
  alias   :chiudi       :close
  
end

class UNIXServer

  alias   :accetta      :accept

end


Presa = Socket
