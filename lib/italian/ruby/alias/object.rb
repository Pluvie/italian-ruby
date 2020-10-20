# frozen_string_literal: true

class Object

  class << self
    alias             :nuovo                :new
    alias             :nuova                :new
    alias             :ottieni_costante     :const_get
    alias             :in_stringa           :to_s
  end

  alias               :nullo?               :nil?
  alias               :nulla?               :nil?
  alias               :risponde_a?          :respond_to?
  alias               :manda                :send
  alias               :ispeziona            :inspect
  alias               :è_un?                :is_a?
  alias               :è_una?               :is_a?
  alias               :valuta_in_istanza    :instance_eval
  alias               :esegui_in_istanza    :instance_exec
  alias               :clona                :clone

  alias               :specificato?         :esiste?
  alias               :specificata?         :esiste?
  alias               :non_è_nullo?         :esiste?
  alias               :non_è_nulla?         :esiste?
  alias               :non_specificato?     :non_esiste?
  alias               :non_specificata?     :non_esiste?
  alias               :non_è_una?           :non_è_un?

  private

    alias             :se_stesso            :istanza
    alias             :se_stessa            :istanza

end

Oggetto = Object
