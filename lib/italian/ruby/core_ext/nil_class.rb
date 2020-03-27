##
# Core Ext - Nil Class

class NilClass
  alias               :nullo?               :nil?
  alias               :nulla?               :nil?

  def esiste?
    !nil?
  end
end