defmodule InputValidation do

  def get_input(question) do
    input = IO.gets question
    result = Integer.parse(input)
    case result do
      :error ->
        IO.puts "Please enter a valid number"
        get_input(input)
      {val, _} ->
        if (val <= 0) do
          IO.puts "Please enter a positive number"
          get_input(input)
        else 
          val
        end
    end
  end
end
