##
# Core Ext - Hanami

module Hanami
  ##
  # Interactor
  module Interactor
    alias               :fallisci!          :error!
    alias               :errore!            :error!
    alias               :errore             :error

    def termina!
      throw :stop
    end

    module LegacyInterface
      def chiama
        _call { super }
      end

      def _call
        catch :fail do
          catch :stop do
            validate!
            yield
          end
        end

        _prepare!
      end
    end
    module Interface
      def chiama(*args)
        @__result = ::Hanami::Interactor::Result.new
        _call(*args) { super }
      end

      def _call(*args)
        catch :fail do
          catch :stop do
            validate!(*args)
            yield
          end
        end

        _prepare!
      end
    end

    class Result
      alias             :riuscito?          :successful?
      alias             :riuscita?          :successful?
      alias             :errore             :error
  
      def fallito?
        !successful?
      end
      alias             :fallita?           :fallito?
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

  ##
  # Mongoid - Repository
  module Mongoid
    class Repository

      def tutti(*args, &block)
        all *args, &block
      end

    end
  end
end
