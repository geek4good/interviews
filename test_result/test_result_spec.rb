require "fileutils"
require "rspec"
require "./test_result"

describe TestResult do
  subject(:test_result) { TestResult.new(folder) }

  let(:folder) { "timestamp" }
  let(:basenames) { %W(01_unit_tests 02_functional_tests 03_integration_tests) }
  let(:outcomes) { %W(success success failure) }

  before do
    FileUtils.mkdir_p(folder)
    basenames.each_with_index do |basename, index|
      filename = File.join(folder, "#{basename}.txt")
      File.write(filename, outcomes[index])
    end
  end

  after do
    FileUtils.rm_rf(folder)
  end

  describe "#to_hash" do
    # => { "01_unit_tests" => "success", "02_functional_tests" => "success", "03_integration_tests" => "failure" }
  end
end
