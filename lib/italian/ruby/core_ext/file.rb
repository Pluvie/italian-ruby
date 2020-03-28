##
# Core Ext - File
#
# Alias di metodi della classe File.

class File
  class << self
    alias         :nome_file              :basename
    alias         :nome_cartella          :dirname
    alias         :esiste?                :exists?
    alias         :scrivi                 :write
    alias         :apri                   :open
  end
end