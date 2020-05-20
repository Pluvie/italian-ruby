begin
  require "awesome_print"
  require "rainbow"
rescue LoadError => error
  raise LoadError, "Per utlizzare il modulo utils/debug è necessario installare le gemme "\
    "`awesome_print` e `rainbow`."
end

##
# Vari metodi e utilità per debuggare.
module Utilità
  module Debug
    class << self

      def debug(*args)
        puts "-----------------------------------------------------------------------------".alzavola
        args.each do |arg|
          ap arg
        end
        puts "-----------------------------------------------------------------------------".alzavola
      end

    end
  end
end

def debug(*args)
  Utilità::Debug.debug *args
end

##
# Crea un metodo per ogni colore da poter chiamare su un'istanza di una stringa.
class String

  COLORI = Hash[
    aliceblue:        :blu_ghiaccio,
    antiquewhite:     :bianco_antico,
    aqua:             :acqua,
    aquamarine:       :acquamarina,
    azure:            :azzurro,
    beige:            :beige,
    bisque:           :biscotto,
    blue:             :blu,
    blueviolet:       :blu_viola,
    brown:            :marrone,
    chartreuse:       :certosa,
    chocolate:        :cioccolato,
    coral:            :corallo,
    cornflower:       :fiordaliso,
    crimson:          :cremisi,
    cyan:             :ciano,
    darkblue:         :blu_scuro,
    darkgray:         :grigio_scuro,
    darkgreen:        :verde_scuro,
    darkmagenta:      :magenta_scuro,
    darkorange:       :arancione_scuro,
    darkorchid:       :orchidea_scuro,
    darkred:          :rosso_scuro,
    darksalmon:       :salmone_scuro,
    darkseagreen:     :verde_mare_scuro,
    darkslateblue:    :blu_ardesia_scuro,
    darkslategray:    :grigio_ardesia_scuro,
    darkturquoise:    :turchese_scuro,
    darkviolet:       :violetta_scuro,
    deeppink:         :rosa_scuro,
    deepskyblue:      :azzurro_cielo_scuro,
    forestgreen:      :verde_foresta,
    fuchsia:          :fucsia,
    gold:             :oro,
    gray:             :grigio,
    green:            :verde,
    greenyellow:      :verde_giallo,
    honeydew:         :melata,
    hotpink:          :rosa_caldo,
    indianred:        :rosso_indiano,
    indigo:           :indaco,
    ivory:            :avorio,
    khaki:            :cachi,
    lavender:         :lavanda,
    lemonchiffon:     :limone_crema,
    lightblue:        :azzurro,
    lightgray:        :grigio_chiaro,
    lightgreen:       :verde_chiaro,
    lightpink:        :rosa_chiaro,
    lightyellow:      :giallo_chiaro,
    lime:             :lime,
    limegreen:        :verde_lime,
    linen:            :biancheria,
    magenta:          :magenta,
    maroon:           :marrone,
    midnightblue:     :blu_notte,
    moccasin:         :mocassino,
    navajowhite:      :bianco_navajo,
    navyblue:         :blu_navy,
    olive:            :oliva,
    orange:           :arancia,
    orangered:        :rosso_arancio,
    orchid:           :orchidea,
    palegreen:        :verde_pallido,
    paleturquoise:    :turchese_pallido,
    peru:             :perù,
    pink:             :rosa,
    plum:             :prugna,
    purple:           :viola,
    red:              :rosso,
    royalblue:        :blu_reale,
    salmon:           :salmone,
    seagreen:         :verde_mare,
    seashell:         :conchiglia,
    sienna:           :terra_di_siena,
    silver:           :argento,
    skyblue:          :blu_cielo,
    slateblue:        :blu_ardesia,
    slategray:        :ardesia,
    snow:             :neve,
    springgreen:      :verde_primavera,
    steelblue:        :blu_acciaio,
    tan:              :abbronzatura,
    teal:             :alzavola,
    thistle:          :cardo,
    tomato:           :pomodoro,
    turquoise:        :turchese,
    violet:           :viola,
    wheat:            :grano,
    whitesmoke:       :bianco_fumo,
    yellow:           :giallo,
    yellowgreen:      :giallo_verde ]

  COLORI.each do |english_color, italian_color|
    self.define_method italian_color do
      Rainbow(self).send(:color, english_color)
    end
  end
end