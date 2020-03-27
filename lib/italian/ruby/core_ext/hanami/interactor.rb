##
# Core Ext - Hanami::Interactor

module Hanami
  module Interactor
    alias               :fallisci!          :error!
    alias               :errore!            :error!
    alias               :errore             :error

    module LegacyInterface
      def chiama
        _call { super }
      end
    end
    module Interface
      def chiama(*args)
        @__result = ::Hanami::Interactor::Result.new
        _call(*args) { super }
      end
    end

    class Result
      alias             :riuscito?          :successful?
      alias             :errore             :error
  
      def fallito?
        !successful?
      end
    end

    Risultato = Result
  end

  Interattore = Interactor

  module ClassMethods
    alias             :esponi             :expose

    def method_added(method_name)
      super
      return unless method_name == :chiama

      if instance_method(:chiama).arity.zero?
        prepend Hanami::Interactor::LegacyInterface
      else
        prepend Hanami::Interactor::Interface
      end
    end
  end
end