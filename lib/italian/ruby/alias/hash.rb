# frozen_string_literal: true

class Hash

  alias         :ispeziona            :inspect
  alias         :per_ogni             :each
  alias         :per_ognuno           :each
  alias         :per_ognuna           :each
  alias         :conteggio            :count
  alias         :dimensione           :size
  alias         :chiavi               :keys
  alias         :valori               :values
  alias         :mappa                :map
  alias         :vuoto?               :empty?
  alias         :vuota?               :empty?
  alias         :ha_chiave?           :has_key?
  alias         :prendi               :fetch
  alias         :deposita             :store
  alias         :scava                :dig
  alias         :fondi                :merge
  alias         :fondi!               :merge!
  alias         :trasforma_chiavi     :transform_keys
  alias         :trasforma_chiavi!    :transform_keys!
  alias         :trasforma_valori     :transform_values
  alias         :trasforma_valori!    :transform_values!
  alias         :seleziona            :select
  alias         :seleziona!           :select!
  alias         :scarta               :reject
  alias         :scarta!              :reject!
  alias         :rimuovi              :delete
  alias         :congela              :freeze
  alias         :tutti?               :all?
  alias         :tutte?               :all?
  alias         :alcuni?              :any?
  alias         :alcune?              :any?
  alias         :almeno_uno?          :any?
  alias         :almeno_una?          :any?
  alias         :nessuno?             :none?
  alias         :nessuna?             :none?
  alias         :in_stringa           :to_json
  alias         :in_mappa             :to_h
  alias         :in_lista             :to_a
  alias         :inverti              :invert

  alias         :specificato?         :esiste?
  alias         :specificata?         :esiste?
  alias         :non_specificato?     :non_esiste?
  alias         :non_specificata?     :non_esiste?

end

Mappa = Hash
