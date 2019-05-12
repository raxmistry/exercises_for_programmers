defmodule Temp do
  import InputValidation

  @scale_to %{:celcius => [:fahrenheit, :kelvin], :fahrenheit => [:celcius, :kelvin], :kelvin => [:celcius, :fahrenheit]}

  def convert(temp, :from_celcius, :to_fahrenheit) do
    (temp * 9 / 5) + 32
  end

  def convert(temp, :from_fahrenheit, :to_celcius) do
    (temp - 32) * 5 /9
  end

  def convert(temp, :from_celcius, :to_kelvin) do
    temp + 273.15 
  end

  def convert(temp, :from_fahrenheit, :to_kelvin) do
    convert(temp, :from_fahrenheit, :to_celcius)
    |> convert(:from_celcius, :to_kelvin)
  end

  def convert(temp, :from_kelvin, :to_celcius) do
    temp - 273.15
  end

  def convert(temp, :from_kelvin, :to_fahrenheit) do
    convert(temp, :from_kelvin, :to_celcius)
    |> convert(:from_celcius, :to_fahrenheit)
  end

  def get_temp_scale() do
    IO.puts "Press C to convert from Celsius."
    IO.puts "Press F to convert from Fahrenheit."
    IO.puts "Press K to convert from Kelvin."
    scale = (IO.gets "Your choice: ") 
            |> String.replace_trailing("\n", "")
            |> String.upcase

    case scale do
      "C" -> :celcius
      "F" -> :fahrenheit
      "K" -> :kelvin
      _ -> IO.puts "Invalid choice"
        get_temp_scale()
    end
  end

  def get_number(question) do
    input = IO.gets question
    result = Integer.parse(input)
    case result do
      :error ->
        IO.puts "Please enter a valid number"
        get_input(input)
      {val, _} ->
         val
    end
  end

  def convert_all(scale, scale_to, temp) do

    if (Enum.count(scale_to) >= 1) do 
      [head|tail] = scale_to
      from = (("from_" <> Kernel.to_string(scale)) |> String.to_atom)
      to = (("to_" <> Kernel.to_string(head)) |> String.to_atom)

      converted = convert(temp, from, to)
      IO.puts "The temerature in #{head |> Kernel.to_string} is #{converted}"
      
      convert_all(scale, tail, temp)
    end
  end

  def convert_all_service(scale, scale_to, temp) do
    if (Enum.count(scale_to) >= 1) do 
      [head|tail] = scale_to
      from = (("from_" <> Kernel.to_string(scale)) |> String.to_atom)
      to = (("to_" <> Kernel.to_string(head)) |> String.to_atom)

      converted = %{head => convert(temp, from, to)}
      Map.merge(converted, convert_all_service(scale, tail, temp))
    else 
      %{}
    end
  end

  def result_scales(scale) do
    @scale_to[scale]
  end

  def convert_temp() do
    scale = get_temp_scale()
    temp = get_input "Please enter the temperature in #{scale}"
    other_scales = @scale_to[scale]
    convert_all(scale, other_scales, temp)
  end
end
