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

  context 'with invalid input like ,\n' do
    let(:input) { '1,\n' }
    it 'raises an error' do
      expect { subject.calculate }.to raise_error('Invalid input')
    end
  end

  context 'with invalid input like \n,' do
    let(:input) { '1,\n' }
    it 'raises an error' do
      expect { subject.calculate }.to raise_error('Invalid input')
    end
  end

  context 'with newline character and comma separated numbers' do
    let(:input) { '1\n2,3' }
    it 'returns the sum of the numbers' do
      expect(subject.calculate).to eq(6)
    end
  end

  context 'with delimiter specified' do
    let(:input) { "//;\n1;2" }
    it 'returns the sum of the numbers' do
      expect(subject.calculate).to eq(3)
    end
  end

  context 'with a negative number' do
    let(:input) { '1,2,3,-4' }
    it 'raises an error' do
      expect { subject.calculate }.to raise_error('negative numbers not allowed -4')
    end
  end
end
