##
# Core Ext - File
#
# Alias di metodi della classe File.

class File
  class << self
    alias         :espandi                :expand_path
    alias         :nome_file              :basename
    alias         :nome_cartella          :dirname
    alias         :esiste?                :exists?
    alias         :scrivi                 :write
    alias         :apri                   :open
  end

  alias           :scrivi                 :write
  alias           :stampa                 :puts

  def self.percorso_non_tradotto(path)
    return path unless path.respond_to? :gsub
    path.gsub("/Users/fballardin/.italian-ruby/translations", "")
  end
end