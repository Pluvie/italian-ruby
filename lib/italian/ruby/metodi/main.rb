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
