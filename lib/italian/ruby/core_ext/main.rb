##
# Core Ext - Main
#
# Alias di metodi del namespace principale.

alias     :stampa                       :puts
alias     :scrivi                       :print
alias     :cicla                        :loop
alias     :dormi                        :sleep
alias     :definisci_metodo_singolo     :define_singleton_method
alias     :blocco_dato?                 :block_given?
alias     :cattura                      :catch
alias     :lancia                       :throw
alias     :Mappa                        :Hash

def includi(*args)
  include *args
end
def preponi(*args)
  prepend *args
end
def estendi(*args)
  extend *args
end

def alza(*args)
  raise *args
end
def fallisci(*args)
  fail *args
end
