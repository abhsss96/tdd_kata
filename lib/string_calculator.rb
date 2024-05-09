class StringCalculator
  REGEX = %r{^//(\D+)(\\n|\n)(.+)}

  def initialize(numbers_string)
    @numbers_string = numbers_string
    @delimiter = /[,\\n]/
  end

  def calculate
    return 0 if @numbers_string.empty?
    raise 'Invalid input' if @numbers_string.match?(/,\\n|\\n,/)

    if @numbers_string.start_with?('//')
      # require 'pry'
      # binding.pry
      match = @numbers_string.match(REGEX)
      raise 'invalid input' unless match

      @delimiter = match[1]

      @numbers_string = match[3]
    end

    numbers = @numbers_string.split(@delimiter).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negative_numbers.join(',')}" unless negative_numbers.none?

    numbers.inject(:+)
  end
end
