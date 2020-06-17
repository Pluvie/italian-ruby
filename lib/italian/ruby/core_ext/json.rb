##
# CoreExt - JSON

module JSON
  def self.processa(*args)
    self.parse(*args)
  end
  def self.in_stringa(*args)
    self.dump(*args)
  end
end