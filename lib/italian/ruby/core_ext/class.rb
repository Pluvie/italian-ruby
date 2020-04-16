##
# CoreExt - Class

class Class
  alias       :privati                :private
  alias       :protetti               :protected
  alias       :pubblici               :public

  alias       :accessore              :attr_accessor

  alias       :definisci_metodo       :define_method

  alias       :apri_classe            :class_eval
end