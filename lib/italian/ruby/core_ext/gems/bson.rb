module BSON
  class ObjectId
    class << self
      alias     :converti           :from_string
    end

    alias       :in_stringa         :to_s

    def to_json(*args)
      "\"#{self.to_s}\""
    end
  end
end
IdOggetto = BSON::ObjectId

class String
  def in_id
    BSON::ObjectId self
  rescue BSON::ObjectId::Invalid
    self
  end
end