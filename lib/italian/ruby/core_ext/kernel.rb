##
# CoreExt - Kernel
#
# Aggiunge i metodi :richiedi e :richiedi_relativo, che permettono di caricare
# un file sorgente scritto in Italian Ruby e usarlo allo stesso modo di come
# funzionano :require e :require_relative di Ruby standard.
#
# È possibile utilizzare :richiedi e :richiedi_relativo sia in file sorgenti
# scritti in Italian Ruby che in file sorgenti scritti in Ruby standard.

module Kernel

  def richiedi(name)
    file_to_require = $:.map { |dir|  Dir["#{dir}/**/#{name}.ir"] }.compact.first
    raise LoadError.new("cannot load such file -- #{name}") if file_to_require.nil?

    traduci_carica_e_distruggi file_to_require
  end

  def richiedi_relativo(name)
    file_to_require = File.expand_path "#{name}.ir"
    raise LoadError.new("cannot load such file -- #{name}") unless File.exist? file_to_require

    traduci_carica_e_distruggi parsed_code, tmp_parsed_file
  end

  private

    def traduci_carica_e_distruggi(file_to_require)
      parsed_code = Italian::Ruby::Traduttore.traduci file_to_require
      file_to_require_dir = File.dirname(file_to_require)
      file_to_require_basename = File.basename(file_to_require, ".ir")
      tmp_parsed_file = "#{file_to_require_dir}/#{file_to_require_basename}.rb"

      File.write tmp_parsed_file, parsed_code
      require tmp_parsed_file
      File.delete tmp_parsed_file if File.exist? tmp_parsed_file
    end

end