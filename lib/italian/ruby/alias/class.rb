# frozen_string_literal: true

class Class

  class << self

    alias       :definisci_metodo       :define_method

  end

  alias       :privati                :private
  alias       :protetti               :protected
  alias       :pubblici               :public
  alias       :accessore              :attr_accessor
  alias       :lettore                :attr_reader
  alias       :scrittore              :attr_writer
  alias       :definisci_metodo       :define_method
  alias       :apri_classe            :class_eval
  alias       :moduli_inclusi         :included_modules

end
