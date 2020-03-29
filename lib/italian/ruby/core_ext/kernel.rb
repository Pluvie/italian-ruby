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
  alias         :classe                         :class
  alias         :ottieni_variabile_istanza      :instance_variable_get
  alias         :imposta_variabile_istanza      :instance_variable_set

  def richiedi(name)
    file_to_require = $:.map { |dir|  Dir["#{dir}/**/#{name}.ir"] }.flatten.compact.first
    raise LoadError.new("cannot load such file -- #{name}") if file_to_require.nil?

    traduci_carica_e_distruggi file_to_require
  end

  def richiedi_relativo(name)
    caller_location_dir = File.dirname caller_locations.first.absolute_path
    file_to_require = File.expand_path "#{caller_location_dir}/#{name}.ir"
    raise LoadError.new("cannot load such file -- #{name}") unless File.exist? file_to_require

    traduci_carica_e_distruggi file_to_require
  end

  def richiedi_assoluto(file)
    raise LoadError.new("cannot load suc file -- #{file}") unless File.exist? file
    traduci_carica_e_distruggi file
  end

  def richiedi_tutti(dir)
    caller_location_dir = "#{File.dirname caller_locations.first.absolute_path}/#{dir}"
    raise LoadError.new("cannot load such directory -- #{dir}") unless Dir.exist? caller_location_dir

    Dir["#{caller_location_dir}/**/*.ir"].each do |file|
      richiedi_assoluto file
    end
  end

  private

    def traduci_carica_e_distruggi(file_to_require)
      parsed_code = Italian::Ruby::Traduttore.traduci file_to_require
      file_to_require_dir = File.dirname(file_to_require)
      file_to_require_basename = File.basename(file_to_require, ".ir")
      tmp_parsed_file = "#{file_to_require_dir}/#{file_to_require_basename}.rb"

      File.write tmp_parsed_file, parsed_code
      require_output = require tmp_parsed_file
      File.delete tmp_parsed_file if File.exist? tmp_parsed_file
      require_output
    end

end