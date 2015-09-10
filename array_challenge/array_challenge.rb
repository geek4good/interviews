class ArrayChallenge
  attr_reader :arrays

  def initialize(arrays)
    @arrays = arrays
  end

  def capitalize_last_letter
    arrays.first.map { |word| word[0..-2] + word[-1].upcase }
  end

  def chars_unique_to_either_collection
    a = arrays.first.join.chars
    b = arrays.last.join.chars

    ((a + b) - (a & b)).sort
  end
end
