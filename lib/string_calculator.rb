class StringCalculator
  def initialize(numbers_string)
    @numbers_string = numbers_string
    @delimiter = /[,\\n]/
  end

  def calculate
    return 0 if @numbers_string.empty?

    raise 'Invalid input' if @numbers_string.match?(/,\\n|\\n,/)

    if @numbers_string.start_with?('//')
      match = @numbers_string.match(%r{^//(.+)\n})
      @delimiter = match[1]

      @numbers_string = @numbers_string[(match[0].length)..]
    end

    numbers = @numbers_string.split(@delimiter).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" unless negative_numbers.none?

    numbers.inject(:+)
  end
end
