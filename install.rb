require_relative "lib/italian/ruby/versione"
versione = Italian::Ruby::VERSIONE

comandi = [
  "gem uninstall -Ix italian-ruby",
  "rm pkg/*.gem",
  "gem build italian-ruby.gemspec -o pkg/italian-ruby-#{versione}.gem",
  "gem install pkg/italian-ruby-#{versione}.gem",
]

comandi.each do |comando|
  puts comando
  %x{#{comando}}
end
