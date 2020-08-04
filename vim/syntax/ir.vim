" Vim syntax file
" Language: Italian Ruby
" Maintainer: Francesco Ballardin
" Latest Revision: 01 July 2020

if exists("b:current_syntax")
  finish
endif

syn match   italianRubyKeyword              /\v(\s|^)(classe|modulo|esegui)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(se|allora|altrimenti_se|a_meno_che|considera|quando|finché|in|definito\?|blocco_dato\?|alias|super)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(prossimo|prossima|esci|ritorna|rilascia|recupera)\s/me=e-1
syn match   italianRubyKeyword              /\v(\s|^)(se|allora|altrimenti|a_meno_che|considera|esci|ritorna|rilascia|blocco_dato\?|super)$/
syn match   italianRubyKeyword              /\v(\s|^)(inizia|recupera|assicura|riprova|esegui|fine)$/

syn region  italianRubyDefinition           start=/definisci/ end=/[$\n\(]/     contains=italianRubySymbol,italianRubyConstant,italianRubyNumeric,italianRubySpecial,italianRubySplatOperator
syn match   italianRubyMethodName           /\v([a-z0-9_=\?\!àèéìòù]+)/         contained   containedin=italianRubyDefinition
syn match   italianRubyDefinitionKeyword    /\vdefinisci/                       contained   containedin=italianRubyDefinition
syn match   italianRubyClassMethodPrefix    /\v(se_stesso|se_stessa)\./he=e-1   contained   containedin=italianRubyDefinition
syn match   italianRubySplatOperator        /\v(\*{1,2}[a-zA-Z0-9_])/he=e-1

syn match   italianRubySymbol               /\v(\s|^)([a-zè_][a-zA-Z0-9àèéìòù_"]+:)/
syn match   italianRubySymbol               /\v(\s|^)("[a-zA-Z0-9àèéìòù_]+":)/
syn match   italianRubySymbol               /\v(\s|^)(:[a-zè_"][a-zA-Z0-9àèéìòù_"]+)/
syn match   italianRubySymbol               /\v(\(|\[)([a-zè_][a-zA-Z0-9àèéìòù_"]+:)/hs=s+1
syn match   italianRubySymbol               /\v(\(|\[)("[a-zA-Z0-9àèéìòù_]+":)/hs=s+1
syn match   italianRubySymbol               /\v(\(|\[|\&)(:[a-zè_"][a-zA-Z0-9àèéìòù_"]+)/hs=s+1

syn match   italianRubyInstanceVar          /\v\@[a-zè_][a-zA-Z0-9àèéìòù_"]*/
syn match   italianRubyConstant             /\v[A-Z][a-zA-Z0-9àèéìòùÀÈÌÒÙ_]+/
syn match   italianRubyComment              /\v#.*$/

syn match   italianRubyNumeric              /\v(\s)+([0-9\.]+)/
syn match   italianRubyInterpolationStart   /\v#\{/                               contained   containedin=italianRubyInterpolation
syn match   italianRubyInterpolationStop    /\v\}/                                contained   containedin=italianRubyInterpolation
syn region  italianRubyInterpolation        start=/\v#\{/   end=/\v\}/            contains=TOP,italianRubyComment   contained   keepend
syn region  italianRubyString               start=/"/       end=/"/   skip=/\\"/  contains=italianRubyInterpolation
syn region  italianRubyString               start=/\v\%\{/  end=/\}/  skip=/\\"/  contains=italianRubyInterpolation

syn match   italianRubySpecial              /\v(\s|^)(includi|estendi|preponi)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(pubblici|protetti|privati)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(richiedi|richiedi_relativo|richiedi_tutti)(\s|$)/
syn match   italianRubySpecial              /\v(\s|^)(cicla|alza)(\s|$)/me=e-1
syn match   italianRubySpecial              /\v(\s|^)(cattura|lancia)\s/me=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)(\s|\,|\()/hs=s+1,he=e-1,me=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)\)/hs=s+1,he=e-1
syn match   italianRubySpecial              /\v\.(nuovo|nuova)$/hs=s+1
syn match   italianRubySpecial              /\v(se_stesso|se_stessa)/
syn match   italianRubySpecial              /\v(\s)+(si|no|nullo|nulla|vero|falso)$/
syn match   italianRubySpecial              /\v(\s)+(si|no|nullo|nulla|vero|falso)\W/he=e-1,me=e-1

let b:current_syntax = "ir"
