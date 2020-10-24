# frozen_string_literal: true
require "date"

class Date

  class << self
    alias       :oggi                       :today
    alias       :converti                   :parse
  end

  alias         :anno_prossimo              :next_year
  alias         :anno_scorso                :prev_year
  alias         :anno_precedente            :prev_year
  alias         :in_stringa                 :to_s
  alias         :in_data                    :to_date
  alias         :in_tempo                   :to_time
  alias         :giorno_della_settimana     :cwday
  alias         :settimana                  :cweek
  alias         :mese                       :month
  alias         :anno                       :year
  alias         :fra?                       :between?
  alias         :formatta                   :strftime

  alias         :due_anni_precedenti        :due_anni_fa
  alias         :formatta                   :formatta_locale

end

Object.send :remove_const, :Data
Data = Date
