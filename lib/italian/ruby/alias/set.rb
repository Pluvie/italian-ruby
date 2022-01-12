# frozen_string_literal: true
require "set"

class Set

  alias         :ispeziona            :inspect
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :trasforma            :map
  alias         :restituisci          :map
  alias         :vuoto?               :empty?
  alias         :vuota?               :empty?
  alias         :primo                :first
  alias         :prima                :first
  alias         :primi                :first
  alias         :prime                :first
  alias         :conteggio            :count
  alias         :conteggia            :count
  alias         :lunghezza            :count
  alias         :tutti?               :all?
  alias         :tutte?               :all?
  alias         :alcuni?              :any?
  alias         :alcune?              :any?
  alias         :almeno_uno?          :any?
  alias         :almeno_una?          :any?
  alias         :nessuno?             :none?
  alias         :nessuna?             :none?
  alias         :uno?                 :one?
  alias         :una?                 :one?
  alias         :congela              :freeze
  alias         :seleziona            :select
  alias         :seleziona!           :select!
  alias         :scarta               :reject
  alias         :scarta!              :reject!
  alias         :in_lista             :to_a

end

Insieme = Set
