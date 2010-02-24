class String
  def strip_non_alphanumeric
    self.gsub(/[^a-zA-Z0-9]/, "")
  end
end