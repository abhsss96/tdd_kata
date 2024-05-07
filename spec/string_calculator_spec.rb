require 'string_calculator'

RSpec.describe StringCalculator do
  let(:subject) { described_class.new(input) }

  context 'with an empty string' do
    let(:input) { '' }
    it 'returns 0 for an empty string' do
      expect(StringCalculator.new('').calculate).to eq(0)
    end
  end
end
