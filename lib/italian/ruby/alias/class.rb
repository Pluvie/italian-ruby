# frozen_string_literal: true

class Class

  class << self

    alias       :definisci_metodo       :define_method

  end

  alias       :privato                :private
  alias       :privati                :private
  alias       :protetto               :protected
  alias       :protetti               :protected
  alias       :pubblico               :public
  alias       :pubblici               :public
  alias       :accessore              :attr_accessor
  alias       :lettore                :attr_reader
  alias       :scrittore              :attr_writer
  alias       :definisci_metodo       :define_method
  alias       :apri_classe            :class_eval
  alias       :valuta_in_classe       :class_eval
  alias       :moduli_inclusi         :included_modules
  alias       :metodo_istanza         :instance_method

end
