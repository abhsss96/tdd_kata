require 'string_calculator'

RSpec.describe StringCalculator do
  let(:subject) { described_class.new(input) }

  context 'with an empty string' do
    let(:input) { '' }

    it 'returns 0' do
      expect(subject.calculate).to eq(0)
    end
  end

  context 'with a single number' do
    let(:input) { '1' }
    it 'returns that number' do
      expect(subject.calculate).to eq(1)
    end
  end

  context 'with a string of numbers' do
    let(:input) { '1,2,3' }

    it 'returns the sum of the numbers' do
      expect(subject.calculate).to eq(6)
    end
  end

  context 'with n numbers' do
    let(:input) { (1...100).to_a.join(',') }

    it 'returns the sum of the numbers' do
      expect(subject.calculate).to eq(4950)
    end
  end
end
