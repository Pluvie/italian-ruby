# frozen_string_literal: true

##
# Include un modulo.
def includi(*args)
  include *args
end

##
# Prepone un modulo.
def preponi(*args)
  prepend *args
end

##
# Estende con un modulo.
def estendi(*args)
  extend *args
end

##
# Solleva un errore.
def alza(*args)
  raise *args
end

##
# Termina il programma.
def fallisci(*args)
  fail *args
end

##
# Definisce un metodo mancante.
def metodo_mancante(nome, *args, &block)
  method_missing nome, *args, &block
end

##
# Avvia un blocco di codice in parallelo.
def in_parallelo(*argomenti, &blocco)
  Ractor.new *argomenti, &blocco
end
