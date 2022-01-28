# frozen_string_literal: true

module FileUtils

  class << self
    alias         :crea_cartella          :mkdir_p
  end

end

UtilitàArchivi = FileUtils
