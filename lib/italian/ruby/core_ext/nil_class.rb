##
# Core Ext - Nil Class

class NilClass
  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :in_stringa           :to_s

  def esiste?
    !nil?
  end
end