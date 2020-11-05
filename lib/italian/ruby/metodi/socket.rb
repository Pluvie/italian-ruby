# frozen_string_literal: true
require "socket"

class UNIXSocket

  def guarda(maxlen)
    recv_nonblock maxlen, Socket::MSG_PEEK
  end

end

class TCPSocket

  def guarda(maxlen)
    recv_nonblock maxlen, Socket::MSG_PEEK
  end

end
