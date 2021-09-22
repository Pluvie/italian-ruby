# frozen_string_literal: true

module Kernel

  alias         :classe                         :class
  alias         :traccia_chiamante              :caller_locations
  alias         :variabili_istanza              :instance_variables
  alias         :ottieni_variabile_istanza      :instance_variable_get
  alias         :imposta_variabile_istanza      :instance_variable_set
  alias         :rimuovi_variabile_istanza      :remove_instance_variable

  class << self

    alias       :chiamante                      :caller
    alias       :traccia_chiamante              :caller_locations

  end

end

Nucleo = Kernel
