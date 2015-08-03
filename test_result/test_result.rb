class TestResult
  attr_reader :folder
  
  def initialize(folder)
    @folder = folder
  end

  def to_hash
    filenames.each_with_object({}) do |filename, test_results|
      test_results[File.basename(filename, ".txt")] = File.read(filename)
    end
  end

  def filenames
    Dir.glob("#{folder}/*.txt")
  end
end
