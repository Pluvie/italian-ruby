# frozen_string_literal: true

module RubyParserStuff
  class Keyword
    expr_woot = EXPR_FNAME|EXPR_FITEM

    italian_wordlist = [
      ["alias",         [:kALIAS,    :kALIAS      ], expr_woot  ],
      ["e",             [:kAND,      :kAND        ], EXPR_BEG   ],
      ["inizia",        [:kBEGIN,    :kBEGIN      ], EXPR_BEG   ],
      ["esci",          [:kBREAK,    :kBREAK      ], EXPR_MID   ],
      ["considera",     [:kCASE,     :kCASE       ], EXPR_BEG   ],
      ["classe",        [:kCLASS,    :kCLASS      ], EXPR_CLASS ],
      ["def",           [:kDEF,      :kDEF        ], EXPR_FNAME ],
      ["definito?",     [:kDEFINED,  :kDEFINED    ], EXPR_ARG   ],
      ["definita?",     [:kDEFINED,  :kDEFINED    ], EXPR_ARG   ],
      ["esegui",        [:kDO,       :kDO         ], EXPR_BEG   ],
      ["fai",           [:kDO,       :kDO         ], EXPR_BEG   ],
      ["altrimenti",    [:kELSE,     :kELSE       ], EXPR_BEG   ],
      ["altrimenti_se", [:kELSIF,    :kELSIF      ], EXPR_BEG   ],
      ["fine",          [:kEND,      :kEND        ], EXPR_END   ],
      ["assicura",      [:kENSURE,   :kENSURE     ], EXPR_BEG   ],
      ["no",            [:kFALSE,    :kFALSE      ], EXPR_END   ],
      ["falso",         [:kFALSE,    :kFALSE      ], EXPR_END   ],
      ["per",           [:kFOR,      :kFOR        ], EXPR_BEG   ],
      ["se",            [:kIF,       :kIF_MOD     ], EXPR_BEG   ],
      ["in",            [:kIN,       :kIN         ], EXPR_BEG   ],
      ["modulo",        [:kMODULE,   :kMODULE     ], EXPR_BEG   ],
      ["prossimo",      [:kNEXT,     :kNEXT       ], EXPR_MID   ],
      ["prossima",      [:kNEXT,     :kNEXT       ], EXPR_MID   ],
      ["nullo",         [:kNIL,      :kNIL        ], EXPR_END   ],
      ["nulla",         [:kNIL,      :kNIL        ], EXPR_END   ],
      ["non",           [:kNOT,      :kNOT        ], EXPR_ARG   ],
      ["o",             [:kOR,       :kOR         ], EXPR_BEG   ],
      ["rifai",         [:kREDO,     :kREDO       ], EXPR_END   ],
      ["riesegui",      [:kREDO,     :kREDO       ], EXPR_END   ],
      ["recupera",      [:kRESCUE,   :kRESCUE_MOD ], EXPR_MID   ],
      ["riprova",       [:kRETRY,    :kRETRY      ], EXPR_END   ],
      ["ritorna",       [:kRETURN,   :kRETURN     ], EXPR_MID   ],
      ["istanza",       [:kSELF,     :kSELF       ], EXPR_END   ],
      ["se_stesso",     [:kSELF,     :kSELF       ], EXPR_END   ],
      ["se_stessa",     [:kSELF,     :kSELF       ], EXPR_END   ],
      ["super",         [:kSUPER,    :kSUPER      ], EXPR_ARG   ],
      ["allora",        [:kTHEN,     :kTHEN       ], EXPR_BEG   ],
      ["si",            [:kTRUE,     :kTRUE       ], EXPR_END   ],
      ["vero",          [:kTRUE,     :kTRUE       ], EXPR_END   ],
      ["undef",         [:kUNDEF,    :kUNDEF      ], expr_woot  ],
      ["a_meno_che",    [:kUNLESS,   :kUNLESS_MOD ], EXPR_BEG   ],
      ["finché",        [:kUNTIL,    :kUNTIL_MOD  ], EXPR_BEG   ],
      ["quando",        [:kWHEN,     :kWHEN       ], EXPR_BEG   ],
      ["mentre",        [:kWHILE,    :kWHILE_MOD  ], EXPR_BEG   ],
      ["rilascia",      [:kYIELD,    :kYIELD      ], EXPR_ARG   ],
      ["INIZIA",        [:klBEGIN,   :klBEGIN     ], EXPR_END   ],
      ["FINE",          [:klEND,     :klEND       ], EXPR_END   ],
      ["__FILE__",      [:k__FILE__, :k__FILE__   ], EXPR_END   ],
      ["__LINE__",      [:k__LINE__, :k__LINE__   ], EXPR_END   ],
      ["__ENCODING__",  [:k__ENCODING__, :k__ENCODING__], EXPR_END],
    ].map { |args| KWtable.new(*args) }

    ITALIAN_WORDLIST = Hash[*italian_wordlist.map { |o| [o.name, o] }.flatten]

    def self.keyword str
      ITALIAN_WORDLIST[str]
    end
  end

  # class OldKeyword
  #   nuove_parole_chiave = [
  #     ['fine',                  %i[kEND kEND],                   :expr_end],
  #     ['recupera',              %i[kRESCUE kRESCUE_MOD],         :expr_mid],
  #     ['rilascia',              %i[kYIELD kYIELD],               :expr_arg],
  #     ['istanza',               %i[kSELF kSELF],                 :expr_end],
  #     ['falso',                 %i[kFALSE kFALSE],               :expr_end],
  #     ['no',                    %i[kFALSE kFALSE],               :expr_end],
  #     ['vero',                  %i[kTRUE kTRUE],                 :expr_end],
  #     ['si',                    %i[kTRUE kTRUE],                 :expr_end],
  #     ['riprova',               %i[kRETRY kRETRY],               :expr_end],
  #     ['ritorna',               %i[kRETURN kRETURN],             :expr_mid],
  #     ['definito?',             %i[kDEFINED kDEFINED],           :expr_arg],
  #     ['definita?',             %i[kDEFINED kDEFINED],           :expr_arg],
  #     ['esci',                  %i[kBREAK kBREAK],               :expr_mid],
  #     ['nullo',                 %i[kNIL kNIL],                   :expr_end],
  #     ['nulla',                 %i[kNIL kNIL],                   :expr_end],
  #     ['prossimo',              %i[kNEXT kNEXT],                 :expr_mid],
  #     ['prossima',              %i[kNEXT kNEXT],                 :expr_mid],
  #     ['ripeti',                %i[kREDO kREDO],                 :expr_end],
  #     ['classe',                %i[kCLASS kCLASS],               :expr_class],
  #     ['altrimenti',            %i[kELSE kELSE],                 :expr_beg],
  #     ['a_meno_che',            %i[kUNLESS kUNLESS],             :expr_beg],
  #     ['assicura',              %i[kENSURE kENSURE],             :expr_beg],
  #     ['allora',                %i[kTHEN kTHEN],                 :expr_beg],
  #     ['fai',                   %i[kDO kDO],                     :expr_beg],
  #     ['procedi',               %i[kDO kDO],                     :expr_beg],
  #     ['esegui',                %i[kDO kDO],                     :expr_beg],
  #     ['inizia',                %i[kBEGIN kBEGIN],               :expr_beg]
  #   ]

  #   nuove_espressioni = [
  #     ['e',                     %i[kAND kAND],                   :expr_beg],
  #     ['considera',             %i[kCASE kCASE],                 :expr_beg],
  #     ['oppure_se',             %i[kELSIF kELSIF],               :expr_beg],
  #     ['per',                   %i[kFOR kFOR],                   :expr_beg],
  #     ['se',                    %i[kIF kIF_MOD],                 :expr_beg],
  #     ['in',                    %i[kIN kIN],                     :expr_beg],
  #     ['modulo',                %i[kMODULE kMODULE],             :expr_beg],
  #     ['o',                     %i[kOR kOR],                     :expr_beg],
  #     ['a_meno_che',            %i[kUNLESS kUNLESS_MOD],         :expr_beg],
  #     ['finché',                %i[kUNTIL kUNTIL_MOD],           :expr_beg],
  #     ['quando',                %i[kWHEN kWHEN],                 :expr_beg],
  #     ['quando_vale',           %i[kWHEN kWHEN],                 :expr_beg],
  #     ['quando_è',              %i[kWHEN kWHEN],                 :expr_beg],
  #     ['mentre',                %i[kWHILE kWHILE_MOD],           :expr_beg]
  #   ]

  #   nuovi_meccanismi_interni = [
  #     ['END',                   %i[klEND klEND],                 :expr_end],
  #     ['BEGIN',                 %i[klBEGIN klBEGIN],             :expr_end],
  #     ['super',                 %i[kSUPER kSUPER],               :expr_arg],
  #     ['__FILE__',              %i[k__FILE__ k__FILE__],         :expr_end],
  #     ['__LINE__',              %i[k__LINE__ k__LINE__],         :expr_end],
  #     ['__ENCODING__',          %i[k__ENCODING__ k__ENCODING__], :expr_end]
  #   ]

  #   nuovi_argomenti = [
  #     ['non',                   %i[kNOT kNOT],                   :expr_beg]
  #   ]

  #   original_verbosity = $VERBOSE
  #   $VERBOSE = nil

  #   parole = [
  #     nuove_parole_chiave,
  #     nuove_espressioni,
  #     nuovi_meccanismi_interni,
  #     nuovi_argomenti
  #   ].flatten(1).map { |args| KWtable.new(*args) }

  #   WORDLIST18 = Hash[*parole.map { |o| [o.name, o] }.flatten]
  #   WORDLIST19 = Hash[*parole.map { |o| [o.name, o] }.flatten]

  #   $VERBOSE = original_verbosity

  #   WORDLIST18.delete '__ENCODING__'

  #   nuove_espressioni.each do |k|
  #     WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
  #     WORDLIST19[k[0]].state = :expr_value
  #   end

  #   nuovi_argomenti.each do |k|
  #     WORDLIST19[k[0]] = WORDLIST19[k[0]].dup
  #     WORDLIST19[k[0]].state = :expr_arg
  #   end
  # end
end