class ArrayChallenge
  attr_reader :arrays

  def initialize(arrays)
    @arrays = arrays
  end

  def capitalize_last_letter
    arrays.first.map { |word| word[0..-2] + word[-1].upcase }
  end

  def chars_unique_to_either_collection
    union = arrays.map(&:join).flat_map(&:chars)
    intersection = arrays.map(&:join).map(&:chars).reduce(:&)

    (union - intersection).sort
  end
end
