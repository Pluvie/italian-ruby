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
end