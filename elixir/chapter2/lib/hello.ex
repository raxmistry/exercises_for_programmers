defmodule Hello do

  def hello(name) do
    "Hello, #{name}, nice to meet you!"
  end

  def greet_with_user_input() do
    name = IO.gets "enter name:"
    IO.puts hello(String.replace_trailing(name, "\n", ""))
  end

  def greet_with_no_variables do
    IO.puts "Hello, #{IO.gets("name: ") |> String.replace_trailing("\n", "")}, nice to meet you"
  end


end
