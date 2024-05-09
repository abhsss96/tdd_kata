class StringCalculator
  REGEX = %r{^//(\D+)(\\n|\n)(.+)}

  def initialize(numbers_string)
    @numbers_string = numbers_string
    @delimiter = /[,\\n]/
    @numbers = []
  end

  def calculate
    return 0 if @numbers_string.empty?

    validate_string!
    @numbers = @numbers_string.split(@delimiter).map(&:to_i)
    validate_numbers!
    skip_number_greater_than_one_thousand!
    @numbers.inject(:+)
  end

  def validate_numbers!
    return if negative_numbers.none?

    raise "negative numbers not allowed #{negative_numbers.join(',')}"
  end

  def skip_number_greater_than_one_thousand!
    @numbers.reject! { |n| n > 1000 }
  end

  def negative_numbers
    @numbers.select(&:negative?)
  end

  def validate_string!
    raise 'Invalid input' if @numbers_string.match?(/,\\n|\\n,/)
    return unless @numbers_string.start_with?('//')
    raise 'invalid input' unless matched_string

    @delimiter = matched_string[1]
    @numbers_string = matched_string[3]
  end

  def matched_string
    @numbers_string.match(REGEX)
  end
end
