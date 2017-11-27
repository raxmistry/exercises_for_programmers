defmodule Temp do
  import InputValidation

  @scale_to %{:celcius => [:fahrenheit, :kelvin], :fahrenheit => [:celcius, :kelvin]}

  def convert(temp, :from_celcius, :to_fahrenheit) do
    (temp * 9 / 5) + 32
  end

  def convert(temp, :from_fahrenheit, :to_celcius) do
    (temp - 32) * 5 /9
  end


  def convert(temp, :from_celcius, :to_kelvin) do
    0
  end

  def convert(temp, :from_fahrenheit, :to_kelvin) do
    1
  end

  def get_temp_scale() do
    IO.puts "Press C to convert from Fahrenheit to Celsius."
    IO.puts "Press F to convert from Celsius to Fahrenheit."
    scale = (IO.gets "Your choice: ") 
            |> String.replace_trailing("\n", "")
            |> String.upcase

    case scale do
      "C" -> :celcius
      "F" -> :fahrenheit
      _ -> IO.puts "Invalid choice"
        get_temp_scale()
    end

  end

  def convert_all(scale, scale_to, temp) do

    [head|tail] = scale_to
    from = (("from_" <> Kernel.to_string(scale)) |> String.to_atom)
    to = (("to_" <> Kernel.to_string(head)) |> String.to_atom)

    converted = convert(temp, from, to)
    IO.puts "The temerature in #{head |> Kernel.to_string} is #{converted}"
    
    convert_all(scale, tail, temp)
  end

  def convert_temp() do
    scale = get_temp_scale()
    temp = get_input "Please enter the temperature in #{scale}"
    other_scales = @scale_to[scale]
    convert_all(scale, other_scales, temp)

  end
end
