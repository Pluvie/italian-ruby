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
  alias         :in_tempo     :to_time
  alias         :formatta     :strftime

  def in_data
    self.to_date
  end
end

Tempo = Time