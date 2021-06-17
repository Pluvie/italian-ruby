# frozen_string_literal: true

class File

  class << self
    alias         :espandi                :expand_path
    alias         :nome_file              :basename
    alias         :nome_cartella          :dirname
    alias         :estensione             :extname
    alias         :esiste?                :exists?
    alias         :scrivi                 :write
    alias         :scrivi_binario         :binwrite
    alias         :leggi                  :read
    alias         :leggi_binario          :binread
    alias         :apri                   :open
    alias         :cancella               :unlink
  end

  alias           :scrivi                 :write
  alias           :stampa                 :puts

  ##
  # Determina se un archivio non esiste.
  def self.non_esiste?(archivio)
    !exists? archivio
  end

end

Archivio = File
