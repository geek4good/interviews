require "fileutils"
require "rspec"
require "./test_result"

describe TestResult do
  before(:all) do
    folder = "timestamp"
    basenames = %W(01_unit_tests 02_functional_tests 03_integration_tests)
    outcomes = %W(success success failure)

    FileUtils.mkdir_p(folder)
    basenames.each_with_index do |basename, index|
      filename = File.join(folder, "#{basename}.txt")
      File.write(filename, outcomes[index])
    end
  end

  after(:all) do
    FileUtils.rm_rf("timestamp")
  end

  subject(:test_result) { TestResult.new }

  describe "#to_hash" do
    # => { "01_unit_tests" => "success", "02_functional_tests" => "success", "03_integration_tests" => "failure" }
  end
end
