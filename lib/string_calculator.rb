class StringCalculator
  def initialize(numbers_string)
    @numbers_string = numbers_string
  end

  def calculate
    return 0 if @numbers_string.empty?

    raise 'Invalid input' if @numbers_string.match?(/,\\n|\\n,/)

    delimiter = /[,\\n]/
    if @numbers_string.start_with?('//')
      match = @numbers_string.match(%r{^//(.+)\n})
      delimiter = match[1]

      @numbers_string = @numbers_string[(match[0].length)..]
    end

    @numbers_string.split(delimiter).map(&:to_i).inject(:+)
  end
end
