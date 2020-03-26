##
# Core Ext - Hanami::Interactor

module Hanami
  module Interactor
    class << self
      def esponi(*args)
        expose *args
      end
    end

    alias               :fallisci!          :error!
    alias               :errore!            :error!
    alias               :errore             :error

    class Result
      alias               :riuscito?          :successful?
      alias               :errore             :error
  
      def fallito?
        !successful?
      end
    end
  end
end