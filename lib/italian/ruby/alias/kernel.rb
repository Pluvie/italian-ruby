# frozen_string_literal: true

module Kernel

  alias         :classe                         :class
  alias         :traccia_chiamante              :caller_locations
  alias         :ottieni_variabile_istanza      :instance_variable_get
  alias         :imposta_variabile_istanza      :instance_variable_set

end
