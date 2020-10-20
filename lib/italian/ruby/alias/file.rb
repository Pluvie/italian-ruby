# frozen_string_literal: true

class File

  class << self
    alias         :espandi                :expand_path
    alias         :nome_file              :basename
    alias         :nome_cartella          :dirname
    alias         :estensione             :extname
    alias         :esiste?                :exists?
    alias         :scrivi                 :write
    alias         :leggi                  :read
    alias         :apri                   :open
  end

  alias           :scrivi                 :write
  alias           :stampa                 :puts

end

Archivio = File
