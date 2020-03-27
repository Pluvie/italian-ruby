##
# Core Ext - Main
#
# Alias di metodi del namespace principale.

alias     :stampa                       :puts
alias     :cicla                        :loop
alias     :definisci_metodo_singolo     :define_singleton_method

def includi(*args)
  include *args
end
def preponi(*args)
  prepend *args
end
def estendi(*args)
  extend *args
end

def privati(*args)
  private
end
def protetti(*args)
  protected
end
def pubblici(*args)
  public
end

def alza(*args)
  raise *args
end
def fallisci(*args)
  fail *args
end

def non_in?(*args)
  !in? *args
end