require "./array_challenge"

describe ArrayChallenge do
  subject(:challenge) { described_class.new(arrays) }

  describe "#captalize_last_letter" do
    let(:arrays) { [%w(ant bee cow)] }

    it "capitalizes the last letter of each word in the collection" do
      result = challenge.capitalize_last_letter

      expect(result).to eq(%w(anT beE coW))
    end
  end

  describe "#chars_unique_to_either_collection" do
    let(:arrays) { [%w(ant bee cat), %w(bat eel fox rat)] }

    it "returns the chars that only exists in either of the arrays" do
      result = challenge.chars_unique_to_either_collection

      expect(result).to eq(%w(c f l n o r x))
    end
  end
end
