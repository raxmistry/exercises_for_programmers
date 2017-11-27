defmodule Rectangle do

  @conversion_factor 0.09290304

  def area(length, width) do
    length * width
  end 

  def convert_area(area_in_feet, :meters) do
    area_in_feet * @conversion_factor
    |> Float.round(3)
  end

  def convert_area(area_in_meters, :feet) do
    area_in_meters / @conversion_factor 
    |> Float.round(3)
  end

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

  def get_input_metric() do
    input = IO.gets("feet or meters?")
            |> String.replace_trailing("\n", "")
            |> String.to_atom()

    case input do
      :meters ->
        input
      :feet ->
        input
      _ ->
        IO.puts "Invalid metric"
        get_input_metric()
    end
  end

  def alt_metric(metric) do
    case metric do
      :meters -> :feet
      :feet -> :meters
    end
  end

  def calculate_area() do
    metric = get_input_metric()
    length = get_input("What is the length of the room in #{metric} ?")
    width = get_input("What is the width of the room in #{metric} ?")

    IO.puts "You entered dimensions of #{length} #{metric} by #{width} #{metric}"
    area = area(length, width)
    alt_metric = alt_metric(metric)
    IO.puts "The area is\n"
    <> "#{area} square #{metric}\n"
    <> "#{convert_area(area, alt_metric)} square #{alt_metric}"
  end
end
