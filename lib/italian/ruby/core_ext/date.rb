require "date"

##
# Core Ext - Date
#
# Alias di metodi della classe Date.

class Date
  class << self
    alias       :oggi                       :today
    alias       :converti                   :parse

    def domani
      oggi + 1
    end
  
    def ieri
      oggi - 1
    end
  end

  alias         :anno_prossimo              :next_year
  alias         :anno_scorso                :prev_year
  alias         :anno_precedente            :prev_year
  alias         :in_stringa                 :to_s
  alias         :in_data                    :to_date
  alias         :in_tempo                   :to_time
  alias         :giorno_della_settimana     :cwday
  alias         :formatta                   :strftime

  def due_anni_fa
    self.prev_year.prev_year
  end
  alias         :due_anni_precedenti        :due_anni_fa

  alias :original_compare :==
  def ==(other)
    return (self == other.to_date) if other.is_a? Time
    original_compare other
  end
end

Data = Date