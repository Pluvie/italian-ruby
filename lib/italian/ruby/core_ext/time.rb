##
# Core Ext - Time
#
# Alias di metodi della classe Time.

class Time
  class << self
    alias       :adesso       :now
    alias       :alla         :at
    alias       :al           :at
  end

  alias         :in_stringa   :to_s
  alias         :in_numero    :to_i
  alias         :formatta     :strftime

  def in_data
    self.to_date
  end

  def in_tempo
    self
  end

  alias :original_compare :==
  def ==(other)
    return (self.to_date == other) if other.is_a? Date
    original_compare other
  end
end

Tempo = Time