##
# Core Ext - Nil Class

class NilClass
  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :in_stringa           :to_s

  def esiste?
    !nil?
  end
  alias               :non_è_nullo?         :esiste?
  alias               :non_è_nulla?         :esiste?
end
