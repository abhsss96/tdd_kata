# StringCalculator

The `StringCalculator` is a Ruby class designed to add numbers given in a string format, supporting custom delimiter specifications. This project is an implementation of the TDD Kata by Roy Osherove ([TDD Kata 1](https://osherove.com/tdd-kata-1/)).

## Features

- **Custom Delimiters**: Supports custom delimiters specified at the start of the input string.
- **Negative Number Handling**: Throws an exception if negative numbers are included in the input.
- **Ignoring Big Numbers**: Numbers greater than 1000 are ignored during the sum calculation.
- **Flexible Input**: Handles new lines between numbers and supports varying numbers of custom delimiters.

## Installation

### 1. Clone the Repository:

```bash
git clone https://github.com/abhsss96/tdd_kata.git
cd string_calculator
```

### 2. Install Dependencies:

Make sure you have Bundler installed; if not, install it with:

```bash
gem install bundler
```

Then run:

```bash
bundle install
```

## Usage

The `StringCalculator` can be used as follows:

```ruby
require './lib/string_calculator'

calculator = StringCalculator.new("//;\n1;2;3")
sum = calculator.calculate
puts "The sum is #{sum}"  # Output will be: The sum is 6
```

This example will parse the string for the custom delimiter `;` and compute the sum of numbers separated by this delimiter.

## Running Tests

This project uses RSpec for testing. To run the tests, execute:

```bash
cd string_calculator
rspec
```

Ensure that the tests in `spec/string_calculator_spec.rb` are set up to cover all functionalities like handling different delimiters, rejecting negative numbers, ignoring numbers greater than 1000, and more.

## Project Structure

The project is organized as follows:

```
├── Gemfile
├── Gemfile.lock
├── lib
│   └── string_calculator.rb
├── README.md
└── spec
    ├── spec_helper.rb
    └── string_calculator_spec.rb
```

- **lib/**: Contains the main Ruby script.
- **spec/**: Contains RSpec test files.
