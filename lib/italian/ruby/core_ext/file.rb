##
# Core Ext - File
#
# Alias di metodi della classe File.

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

  def self.percorso_non_tradotto(path)
    return path unless path.respond_to? :partition
    path.partition(".italian-ruby/translations").last
  end
end