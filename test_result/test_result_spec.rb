require "fileutils"
require "rspec"
require "./test_result"

describe TestResult do
  let(:folder) { "timestamp" }
  let(:basenames) { %W(01_unit_tests 02_functional_tests 03_integration_tests) }

  before(:all) do
    FileUtils.mkdir_p(folder)
    basenames.each_with_index do |basename, index|
      filename = File.join(folder, "#{basename}.txt")
      File.write(filename, index == 2 ? "failure" : "success")
    end
  end

  after(:all) do
    FileUtils.rm_rf()
  end

  describe "#to_hash" do
    # => { "01_unit_tests" => "success", "02_functional_tests" => "success", "03_integration_tests" => "failure" }
  end
end
