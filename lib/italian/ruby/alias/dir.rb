# frozen_string_literal: true

class Dir

  class << self
    alias         :ricerca                :glob
    alias         :esiste?                :exists?
  end

end

Cartella = Dir
