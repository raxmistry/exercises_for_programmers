defmodule Chapter2 do
  @moduledoc """
  Documentation for Chapter2.
  """

  @doc """
  Hello world.

  ## Examples


  """
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

  def count_chars_user_input() do
    str = IO.gets "Enter a String:" 
    str |> String.replace_trailing("\n", "") |> count_chars()
  end

  def count_chars(input) when input=="" do
    IO.puts "No empty strings allowed. Please enter a String:"
    count_chars_user_input()
  end

  def count_chars(input) do
    "#{input} has #{String.length(input)} characters."
  end
end
