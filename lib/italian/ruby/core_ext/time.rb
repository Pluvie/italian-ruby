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
  alias         :localizza    :localtime
  alias         :secondi      :sec
  alias         :secondo      :sec
  alias         :minuto       :min
  alias         :minuti       :min
  alias         :ore          :hour
  alias         :ora          :hour

  def in_data
    self.to_date
  end

  def in_tempo
    self
  end

  def formatta_locale(format)
    if defined? I18n
      I18n.l self, format: format
    else
      strftime format
    end
  end

  alias :original_equality :==
  def ==(other)
    return (self.to_date == other) if other.is_a? Date
    original_equality other
  end

  alias :original_compare :<=>
  def <=>(other)
    return (self.to_date <=> other) if other.is_a? Date
    original_compare other
  end

  def inizio_ora
    Time.new(self.year, self.month, self.day, self.hour)
  end

  def fine_ora
    Time.new(self.year, self.month, self.day, self.hour, 59, 59)
  end

  def inizio_minuto
    Time.new(self.year, self.month, self.day, self.hour, self.min)
  end

  def fine_minuto
    Time.new(self.year, self.month, self.day, self.hour, self.min, 59)
  end
end

Tempo = Time
