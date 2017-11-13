defmodule Paint do

  import InputValidation

  @area_per_gallon 350

  def area(width, length) do
    width * length
  end

  def area(radius) do
    :math.pi * :math.pow(radius, 2)
    |> Kernel.round() end 
  
  def gallons_required(area) do 
    area / @area_per_gallon |> Float.ceil 
  end 
  
  def paint_room() do width = get_input("Width of room? ")
    length = get_input("Length of room? ")
    area = area(width, length)

    calculate_area_and_output(area)
  end

  def paint_circular_room() do 
    radius = get_input("Radius of room? ")
    area = area(radius)

    calculate_area_and_output(area)
  end

  def calculate_area_and_output(area) do
    gallons = gallons_required(area)

    IO.puts "You will need to purchase #{gallons} gallons of paint to cover #{area} meters"
  end


end
