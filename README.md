# Italian::Ruby

Benvenuti nella gemma `italian/ruby`.
Scrivo questo tutorial in italiano, perché, diciamocelo, chi sarebbe interessato a questa gemma se non fosse italiano? La gemma è semplice. Ti permette di scrivere Ruby, ma usando la nostra cara lingua madre.

Son da sempre convinto che una delle difficoltà della programmazione sia pensare e leggere il codice sorgente scritto in una lingua che non ti è nativa. Infatti, per quanto vogliamo raccontarcela e per quanti film in inglese scegliamo di guardare, finché viviamo in Italia, penseremo e parleremo in italiano.
Questo vuol dire che, quando programmiamo software, dobbiamo pensare l'algoritmo, tradurlo in inglese, tradurlo in Ruby e poi scriverlo a tastiera. Allo stesso modo, quando leggiamo software, dobbiamo tradurre dall'inglese, tradurre dal Ruby e poi ricostruire l'algoritmo in testa.

E se eliminassimo un passaggio? Beh diciamo che più che eliminarlo, lo facciamo fare ad una macchina. D'altra parte le macchine fan questo: attività ripetitive, banali, e stupide. Sì perché le macchine sono e resteranno sempre stupide. E non fatemi iniziare a parlare di "intelligenza" artificiale.. !
Ecco il motivo della nascita di Italian Ruby.

## Installazione

Al solito.

```ruby
gem 'italian-ruby'
```

Oppure.

```bash
gem install italian-ruby
```

Per poterla usare bisogna caricarla.

```ruby
require "italian/ruby"
```

## Utilizzo

Il codice sorgente in Italian Ruby è scritto in file con estensione `.ir`. Ho fatto anche una grammatica per l'evidenziazione della sintassi, funziona per VS Code, penso anche per altri editor, la trovate nel file `vscode/italianruby.tmGrammar.json` in questo repository.

A questo punto ci sono due strade. Prima strada, usare l'eseguibile `italian-ruby`:

```ruby
# persona.ir
classe Persona
  def inizializzatore(nome)
    @nome = nome
  fine

  def come_ti_chiami?
    stampa "Ciao, mi chiamo #{@nome}."
  fine
fine

toni = Persona.nuova("Toni")
toni.come_ti_chiami?
```

Eseguendolo così:

```bash
italian-ruby persona.ir
# Ciao, mi chiamo Toni.
```

Oppure si può richiedere all'interno di codice sorgente Ruby standard, in modo che venga caricato esattamente come fa il `require` di Ruby standard. Esempio:

```ruby
# libreria_interessantissima.rb
modulo LibreriaInteressantissima
  def se_stesso.metodo_interessantissimo
    stampa "Che roba!"
  fine
fine

# tuo_file_ruby.rb
require "italian/ruby"
richiedi_relativo "libreria_interessantissima"

LibreriaInteressantissima.metodo_interessantissimo
# Che roba!
```

È possibile anche utilizzare il `richiedi`, che funziona come il `require` di Ruby, nel remoto caso in cui _qualcuno_ faccia una gemma in Italian Ruby, la pubblichi su rubygems.org e _qualcun'altro_ la scarichi e la installi. Se mai succedesse, funzionerebbe così:

```ruby
# tuo_file_ruby.rb
require "italian/ruby"
richiedi "gemma_impossibile"

GemmaImpossibile.esiste?
# false
```

## Come funziona?

> Vuoi sapere la verità su una cosa? Allora devi sapere **come funziona**.
>
> \- un tizio saggio, qualche anno fa.

Volete sapere la verità su Italian Ruby? Ecco come funziona. Ho preso ispirazione da questa gemma che si chiama [Bato](https://github.com/jjuliano/bato). Praticamente è la stessa cosa di Italian Ruby solo che in filippino. Bato vuole dire "Roccia" in filippino. Bato funziona usando la gemma [RubyParser](https://github.com/seattlerb/ruby_parser) che parsa codice Ruby e lo converte in espressioni sexp, e la gemma [Ruby2Ruby](https://github.com/seattlerb/ruby2ruby) che converte espressioni sexp in codice Ruby.
In mezzo a queste due, ci infiliamo la nostra gemma, che, patchando il ruby parser, legge codice in italiano e lo converte in espressioni sexp. Il trucco sta nel file `lib/italian/ruby/ruby_parser_patches.rb` dove vengono definite nuove keywords al posto di quelle originali (es. `classe` al posti di `class`).

Bato però ha solo un binario che permette di eseguire codice filippino. Italian Ruby, invece, permette di inglobare codice italiano all'interno di progetti Ruby già esistenti. Avete un gigantesco codebase con megabyte di codice, ma volete riscrivere un solo piccolo pezzettino in italiano? Con Italian Ruby si può.

Per concludere, ci sono degli avvertimenti.
1. il namespace verrà sporcato. Ho fatto del mio meglio per essere più chirurgico possibile, ma se fate `require "italian/ruby"` sappiate che verranno su un sacco di classi e di alias nuovi (es. `Oggetto.nuovo` ecc.).
2. il `richiedi` e `richiedi_relativo` funzionano traducendo un file sorgente in italiano nella stessa cartella in cui si trova, caricandolo in memoria con il `require` di Ruby, e poi cancellandolo. Non so se questo possa creare problemi. Immagino di no. Ma vi ho avvertito!

## Contribuire

Bug e issue qui -> https://github.com/[USERNAME]/italian-ruby.
