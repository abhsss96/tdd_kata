class StringCalculator
  def initialize(string_numbers)
    @string_numbers = string_numbers
  end

  def calculate
    return 0 if @string_numbers.empty?
    raise 'Invalid input' if @string_numbers.include? ',\n'

    @string_numbers.split(',').map(&:to_i).inject(:+)
  end
end
