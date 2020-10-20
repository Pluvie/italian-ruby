# frozen_string_literal: true

class Module

  private

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene incluso.
    def quando_incluso(*args)
    end

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene esteso.
    def quando_esteso(*args)
    end

    ##
    # Metodo delegato per la chiamata di ritorno da
    # avviare quando il modulo viene preposto.
    def quando_preposto(*args)
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def included(*args)
      quando_incluso *args
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def extended(*args)
      quando_esteso *args
    end

    ##
    # Sovrascrive il metodo originale in modo che chiami
    # il metodo delegato.
    def prepended(*args)
      quando_preposto *args
    end

end
