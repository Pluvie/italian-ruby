" Vim syntax file
" Language: Italian Ruby
" Maintainer: Francesco Ballardin
" Latest Revision: 01 July 2020

if exists("b:current_syntax")
  finish
endif

syn match   italianRubyKeyword              /\v(\s)*(classe|modulo|esegui|fine)(\s|$)/
syn match   italianRubyKeyword              /\v(\s)*(se|allora|altrimenti|altrimenti_se|considera|quando|finché)(\s|$)/
syn match   italianRubyKeyword              /\v(\s)*(prossimo|prossima|esci|ritorna|rilascia|blocco_dato\?)(\s|$)/
syn match   italianRubyKeyword              /\v(\s)*(recupera|assicura|riprova)(\s|$)/

syn match   italianRubySymbol               /\v(\s)*([a-zè_][a-zA-Z0-9àèéìòù_"]+:)/
syn match   italianRubySymbol               /\v(\s)*("[a-zA-Z0-9àèéìòù_]+":)/
syn match   italianRubySymbol               /\v(\s)*(:[a-zè_"][a-zA-Z0-9àèéìòù_"]+)/

syn match   italianRubyInstanceVar          /\v[\s^]*\@[a-zè_][a-zA-Z0-9àèéìòù_"]*/
syn match   italianRubyConstant             /\v[A-Z][a-zA-Z0-9àèéìòù_]+/
syn match   italianRubyComment              /\v#.*$/

syn match   italianRubyInterpolationStart   /\v#\{/                             containedin=italianRubyInterpolation
syn match   italianRubyInterpolationStop    /\v\}/                              containedin=italianRubyInterpolation
syn region  italianRubyInterpolation        start=/\v#\{/ end=/\v\}/            contains=TOP,italianRubyComment   contained   keepend
syn region  italianRubyString               start=/"/     end=/"/   skip=/\\"/  contains=italianRubyInterpolation

syn match   italianRubySpecial              /\v(\s|$)*(includi|estendi|preponi)(\s|$)/
syn match   italianRubySpecial              /\v(\s|$)*(pubblici|protetti|privati)(\s|$)/
syn match   italianRubySpecial              /\v(\s|$)*(richiedi|richiedi_relativo|richiedi_tutti)(\s|$)/
syn match   italianRubySpecial              /\v(\s|$)*(cicla|alza)(\s|$)/
syn match   italianRubySpecial              /\v\.(nuovo|nuova)/hs=s+1
syn match   italianRubySpecial              /\v(se_stesso|se_stessa)/
syn match   italianRubySpecial              /\v(\*){1,2}[a-zA-Z_]/he=e-1

syn region  italianRubyDefinition           start=/definisci/ end=/[$\n]/       contains=italianRubyDefinitionKeyword,italianRubyMethodName,italianRubySplatOperator
syn match   italianRubyDefinitionKeyword    /\vdefinisci/                       contained
syn match   italianRubyMethodName           /\v([a-z0-9_]+)\(/he=e-1            contained
syn match   italianRubyMethodName           /\v([a-z0-9_]+)$/                   contained
syn match   italianRubySplatOperator        /\v(\*{1,2}[a-zA-Z0-9_])/he=e-1

let b:current_syntax = "ir"
