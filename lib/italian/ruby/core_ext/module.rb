##
# CoreExt - Module

class Module
  alias       :privati                :private
  alias       :protetti               :protected
  alias       :pubblici               :public

  private

    def quando_incluso(*args)
    end

    def quando_esteso(*args)
    end

    def quando_preposto(*args)
    end

    def included(*args)
      quando_incluso *args
    end

    def extended(*args)
      quando_esteso *args
    end

    def prepended(*args)
      quando_preposto *args
    end

end