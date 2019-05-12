defmodule SimpleMath do

  def prompt_for_numbers do
    first_number = input_number("What is the first number?")
    second_number = input_number("What is the second number?")

    sum = first_number + second_number
    diff = first_number - second_number
    product = first_number * second_number
    division = (first_number / second_number) |> Kernel.round()

    IO.puts "#{first_number} + #{second_number} = #{sum}\n#{first_number} - #{second_number} = #{diff}\n#{first_number} * #{second_number} = #{product}\n#{first_number} / #{second_number} = #{division}"
  end

  def convert_to_number(string) do
    {number, _} = Integer.parse(string)
    number
  end

  def input_number(question) do
    input = IO.gets question
    if (input |> Integer.parse()) == :error do
      IO.puts "Not a number"
      input_number(question)
    else
      number = convert_to_number(input)
      if (number <0) do
        IO.puts "Negative number!"
        input_number(question)
      else
        number
      end
    end
  end
end

