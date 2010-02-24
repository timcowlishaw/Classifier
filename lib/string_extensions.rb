class String
  def strip_non_alphanumeric
    self.gsub(/[^a-zA-Z0-9]/, "")
  end
  
  def to_classifiable_words
    self.split(/\s/).reject(&:blank?).map {|word| word.strip_non_alphanumeric.downcase.stem }
  end
end