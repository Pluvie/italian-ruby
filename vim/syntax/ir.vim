" Vim syntax file
" Language: Italian Ruby
" Maintainer: Francesco Ballardin
" Latest Revision: 01 July 2020

if exists("b:current_syntax")
  finish
endif

syn match   italianRubyKeyword              /\v[\s^]*(classe|modulo|definisci|esegui|fine)(\s|$)/
syn match   italianRubyKeyword              /\v[\s^]*(se|allora|altrimenti|altrimenti_se|considera|quando|finché)(\s|$)/
syn match   italianRubyKeyword              /\v[\s^]*(prossimo|prossima|esci|ritorna|rilascia|blocco_dato\?)(\s|$)/
syn match   italianRubyKeyword              /\v[\s^]*(recupera|assicura|riprova)(\s|$)/
syn match   italianRubySpecial              /\v[\s^]*(includi|estendi|preponi)(\s|$)/
syn match   italianRubySpecial              /\v[\s^]*(pubblici|protetti|privati)(\s|$)/
syn match   italianRubySpecial              /\v[\s^]*(richiedi|richiedi_relativo|richiedi_tutti)(\s|$)/
syn match   italianRubySpecial              /\v[\s^]*(cicla|alza)(\s|$)/
syn match   italianRubySpecial              /\v\.(nuovo|nuova)/hs=s+1,he=e
syn match   italianRubySpecial              /\v(se_stesso|se_stessa)/
syn match   italianRubyMethod               /\vdefinisci [a-z0-9_]+/ms=s+10,hs=s,he=e
syn match   italianRubyMethod               /\v\.[a-z_\?\!]+[\s\)\.]/hs=s+1,he=e-1
syn match   italianRubyMethod               /\v\.[a-z_\?\!]+$/hs=s+1,he=e
syn match   italianRubySymbol               /\v[\s^*]*([a-zA-Zè_"][a-zA-Z0-9aèéìòù_"]+):\s/
syn match   italianRubyComment              /\v#.*$/
syn region  italianRubyInterpolation        start=/#{/    end=/}/               contains=TOP,italianRubyComment   contained
syn region  italianRubyString               start=/"/     end=/"/   skip=/\\"/  contains=italianRubyInterpolation

let b:current_syntax = "ir"
