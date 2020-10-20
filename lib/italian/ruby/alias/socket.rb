# frozen_string_literal: true
require "socket"

class UNIXServer

  alias   :accetta      :accept

end

class Socket

  alias   :scrivi       :write
  alias   :leggi        :read
  alias   :leggi_linea  :readline
  alias   :chiudi       :close

end

Presa = Socket
