module Enumerable
  def dot_product(other)
    self.zip(other).map {|a,b| a * b}.inject(0) {|m, n| m + n}
  end
end