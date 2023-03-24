" Vim syntax file
" Language: Italian Ruby
" Maintainer: Francesco Ballardin
" Latest Revision: 01 July 2020

if exists("b:current_syntax")
  finish
endif

syn match   italianRubyKeyword              /\v(\s|^)(classe|modulo|esegui)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(se|allora|altrimenti_se|a_meno_che|considera|quando|mentre|finché|in|definito\?|blocco_dato\?|alias|super)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(prossimo|prossima|esci|ritorna|rilascia|recupera|fine)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)fine[\.,]/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(se|allora|altrimenti|a_meno_che|considera|esci|ritorna|rilascia|blocco_dato\?|super)$/
syn match   italianRubyKeyword              /\v(\s|^)(prossimo|prossima|inizia|recupera|assicura|riprova|esegui|fine)$/

syn region  italianRubyDefinition           start=/definisci/ end=/$/                                   keepend contains=italianRubySymbol,italianRubyConstant,italianRubyNumeric,italianRubySpecial,italianRubySplatOperator, italianRubyToProcOperator
syn region  italianRubyMethodDefinition     start=/\vdefinisci [a-z0-9_=\.\?\!àèéìòù]+/ end=/\v[ \(]/   keepend contained containedin=italianRubyDefinition
syn match   italianRubyMethodName           /\v([a-z0-9_=\?\!àèéìòù]+)/                                 contained   containedin=italianRubyMethodDefinition
syn match   italianRubyDefinitionKeyword    /definisci/                                                 contained   containedin=italianRubyMethodDefinition
syn match   italianRubyClassMethodPrefix    /\v(se_stesso|se_stessa)\./he=e-1                           contained   containedin=italianRubyMethodDefinition

syn match   italianRubySplatOperator        /\v(\*{1,2}[a-zA-Z0-9_])/he=e-1,me=e-1
syn match   italianRubyToProcOperator       /\v(\&[a-zA-Z0-9àèéìòù_]+)/he=s+1

syn match   italianRubySymbol               /\v(\s|^)([a-zè_][a-zA-Z0-9àèéìòù_]*:)/
syn match   italianRubySymbol               /\v(\s|^)(:[a-zA-Zè_][a-zA-Z0-9àèéìòù_]*)/
syn match   italianRubySymbol               /\v(\s|^)("[a-zA-Z0-9àèéìòù_\/]*":)/
syn match   italianRubySymbol               /\v(\s|^)(:"[a-zA-Z0-9àèéìòù_\/]*")/
syn match   italianRubySymbol               /\v\((:[a-zA-Zè_][a-zA-Z0-9àèéìòù_]*)\)/ms=s+1,me=e-1
syn match   italianRubySymbol               /\v(\(|\[)([a-zèA-Z_][a-zA-Z0-9àèéìòù_"]+:)/hs=s+1
syn match   italianRubySymbol               /\v(\(|\[)("[a-zA-Z0-9àèéìòù_]+":)/hs=s+1
syn match   italianRubySymbol               /\v(\(|\[|\&)(:[a-zA-Zè_"][a-zA-Z0-9àèéìòù_"]+)/hs=s+1

syn match   italianRubyConstant             /\v[A-Z][a-zA-Z0-9àèéìòùÀÈÌÒÙ_]+/
syn match   italianRubyConstant             /\v(\s|^)([a-zè_][a-zA-Z0-9àèéìòù_]*::)/he=e-2
syn match   italianRubyComment              /\v#.*$/
syn match   italianRubyInstanceVar          /\v\@[a-zè_][a-zA-Z0-9àèéìòù_"]*/
syn match   italianRubyInstanceVar          /\v\@\@[a-zè_][a-zA-Z0-9àèéìòù_"]*/
syn match   italianRubyGlobalVar            /\v\$[a-zA-Zè_][a-zA-Z0-9àèéìòù_"]*/

syn match   italianRubyNumeric              /\v([0-9]+[\.\_]*)+(\s|\n|\t|\.|,|;){1}/me=e-1
syn match   italianRubyNumeric              /\v(\[|\()([0-9\.\_]+)(\]|\))/ms=s+1,me=e-1
syn match   italianRubyInterpolationStart   /\v#\{/                                 contained   containedin=italianRubyInterpolation
syn match   italianRubyInterpolationStop    /\v\}/                                  contained   containedin=italianRubyInterpolation
syn region  italianRubyInterpolation        start=/\v#\{/   end=/\v\}/              contains=TOP,italianRubyComment   contained   keepend
syn region  italianRubyString               start=/"/       end=/"/     skip=/\\"/  contains=italianRubyInterpolation
syn region  italianRubyString               start=/\v\%\{/  end=/\}/    skip=/\\"/  contains=italianRubyInterpolation
syn region  italianRubyString               start=/\V<<-STR/  end=/STR/             contains=italianRubyInterpolation
syn region  italianRubyString               start=/\V<<~STR/  end=/STR/             contains=italianRubyInterpolation
syn region  italianRubyRegexp               start="\V/"       end="\V/"             contains=italianRubyInterpolation oneline
syn match   italianRubyRegexpSpecial        "\v\\/|\\n|\\r|\\.|\^|\$"               contained   containedin=italianRubyRegexp
syn match   italianRubyRegexpSpecial        "\v\\s|\\S|\\d|\\D"                     contained   containedin=italianRubyRegexp
syn match   italianRubyRegexpSpecial        "\v\\w|\\W|\\b|\\B"                     contained   containedin=italianRubyRegexp

syn match   italianRubyInvocation           /\vinvoca /me=e-1
syn match   italianRubySpecial              /\v(\s|^)(includi|estendi|preponi)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(pubblici|pubblico|protetti|protetto|privati|privato)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(richiedi|richiedi_relativo|richiedi_tutti|rimanda|rimanda_relativo)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(cicla|alza)(\s|$)/me=e-1
syn match   italianRubySpecial              /\v(\s|^)(cattura|lancia)\s/me=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)(\s|\,|\()/hs=s+1,he=e-1,me=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)\)/hs=s+1,he=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)$/hs=s+1
syn match   italianRubySpecial              /\v(se_stesso|se_stessa)/
syn match   italianRubySpecial              /\v(definisci_metodo|definisci_metodo_singolo)\s/he=e-1,me=e-1
syn match   italianRubySpecial              /\v(\s)+(si|no|nullo|nulla|vero|falso)$/
syn match   italianRubySpecial              /\v(\s)+(si|no|nullo|nulla|vero|falso)\W/he=e-1,me=e-1

highlight italianRubyKeyword                ctermfg=171
highlight italianRubyDefinitionKeyword      ctermfg=171
highlight italianRubySpecial                ctermfg=33
highlight italianRubyInvocation             ctermfg=171
highlight italianRubyClassMethodPrefix      ctermfg=33
highlight italianRubyMethodName             ctermfg=220
highlight italianRubySymbol                 ctermfg=33
highlight italianRubyNumeric                ctermfg=148
highlight italianRubySplatOperator          ctermfg=117
highlight italianRubyToProcOperator         ctermfg=117
highlight italianRubyInstanceVar            ctermfg=117
highlight italianRubyGlobalVar              ctermfg=117
highlight italianRubyInterpolationStart     ctermfg=117
highlight italianRubyInterpolationStop      ctermfg=117
highlight italianRubyConstant               ctermfg=43
highlight italianRubyComment                ctermfg=28
highlight italianRubyString                 ctermfg=208
highlight italianRubyRegexp                 ctermfg=197
highlight italianRubyRegexpSpecial          ctermfg=223

let b:current_syntax = "ir"
