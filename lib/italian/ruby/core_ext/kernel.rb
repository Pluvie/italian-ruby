require "fileutils"

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

  def carica(name)
    traduci_e_carica File.expand_path(name)
  end

  def richiedi(name)
    file_to_require = $:.map { |dir| Dir["#{dir}/**/#{name}.ir"] }.flatten.compact.first

    if file_to_require.nil?
      begin
        require name
      rescue SyntaxError => errore
        riga = errore.message.split("\n").first.split(":")[1].to_i rescue 0
        Italian::Ruby::Errore::Sintassi.new("Errore di sintassi.", name, riga, 0).stampa
      end
    else
      traduci_e_richiedi file_to_require
    end
  end

  def richiedi_relativo(name)
    caller_location_dir = File.dirname caller_locations.first.absolute_path
    if caller_location_dir.start_with?(Italian::Ruby.translations_dir_path)
      caller_location_dir = caller_location_dir[Italian::Ruby.translations_dir_path.length..-1]
    elsif caller_location_dir.include?(".italian-ruby/")
      caller_location_dir.gsub! ".italian-ruby/", ""
    end
    caller_location_file = File.expand_path "#{caller_location_dir}/#{name}"
    file_to_require = Dir["#{caller_location_file}.{ir,rb}"].compact.first
    raise LoadError.new("cannot load such file -- #{name}") unless File.exist? file_to_require

    traduci_e_richiedi file_to_require
  end

  def richiedi_assoluto(file)
    raise LoadError.new("cannot load such file -- #{file}") unless File.exist? file
    traduci_e_richiedi file
  end

  def richiedi_tutti(dir)
    caller_location_dir = "#{File.dirname caller_locations.first.absolute_path}/#{dir}"
    if caller_location_dir.start_with?(Italian::Ruby.translations_dir_path)
      caller_location_dir = caller_location_dir[Italian::Ruby.translations_dir_path.length..-1]
    end
    raise LoadError.new("cannot load such directory -- #{dir}") unless Dir.exist? caller_location_dir

    Dir["#{caller_location_dir}/**/*.ir"].each do |file|
      richiedi_assoluto file
    end
  end

  private

    def traduci_file(file_to_translate)
      file_to_translate_dir       = File.dirname file_to_translate
      file_to_translate_ext       = File.extname file_to_translate
      file_to_translate_basename  = File.basename file_to_translate, file_to_translate_ext

      parsed_dir = File.join Italian::Ruby.translations_dir_path, file_to_translate_dir
      FileUtils.mkdir_p parsed_dir unless Dir.exists? parsed_dir
      parsed_file = File.join parsed_dir, "#{file_to_translate_basename}.rb"

      if file_to_translate_ext == ".rb"
        parsed_code = File.read file_to_translate
      else
        parsed_code = Italian::Ruby::Traduttore.traduci file_to_translate
      end

      File.write parsed_file, parsed_code
      parsed_file
    end

    def traduci_e_richiedi(file_to_require)
      parsed_file = traduci_file file_to_require

      begin
        require parsed_file
      rescue SyntaxError => errore
        riga = errore.message.split("\n").first.split(":")[1].to_i rescue 0
        Italian::Ruby::Errore::Sintassi.new("Errore di sintassi.", parsed_file, riga, 0).stampa
      end
    end

    def traduci_e_carica(file_to_load)
      parsed_file = traduci_file file_to_load

      begin
        load parsed_file
      rescue SyntaxError => errore
        riga = errore.message.split("\n").first.split(":")[1].to_i rescue 0
        Italian::Ruby::Errore::Sintassi.new("Errore di sintassi.", parsed_file, riga, 0).stampa
      end
    end

end