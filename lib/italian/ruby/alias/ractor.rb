# frozen_string_literal: true

class Ractor

  class << self
    alias :manda      :yield
    alias :ricevi     :receive
  end

  alias :ricevi       :take
  alias :attendi      :take
  alias :manda        :send
  
end

Parallelo = Ractor
