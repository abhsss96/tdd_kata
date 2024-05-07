class StringCalculator
  def initialize(string_numbers)
    @string_numbers = string_numbers
  end

  def calculate
    return 0 if @string_numbers.empty?

    @string_numbers.split(',').map(&:to_i).inject(:+)
  end
end
