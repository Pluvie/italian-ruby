# frozen_string_literal: true

module Kernel

  alias         :classe                         :class
  alias         :ottieni_variabile_istanza      :instance_variable_get
  alias         :imposta_variabile_istanza      :instance_variable_set

end
