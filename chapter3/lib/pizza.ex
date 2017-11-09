defmodule Pizza do
  import InputValidation

  def total_slices(number_of_pizzas, slices_per_pizza) do
    number_of_pizzas * slices_per_pizza
  end

  def slices_per_person(number_of_slices, number_of_people) do
   div(number_of_slices, number_of_people) 
  end

  def leftover_pizza(number_of_slices, number_of_people) do
    rem(number_of_slices, number_of_people)
  end

  def pluralization(number) do
    if number == 1, do: "piece", else: "pieces"
  end

  def output_pizzas(slices_pp) do
    pcs = pluralization(slices_pp)
    "Each person gets #{slices_pp} #{pcs} of pizza"
  end

  def output_leftovers(remaining) do
    pcs = pluralization(remaining)
    "There are #{remaining} leftover #{pcs}"
  end

  def pizza_party() do
  
    no_people = get_input("How many people? ")
    no_pizzas = get_input("How many pizzas do you have? ")
    slices_per_pizza = get_input("Slices per pizza? ")

    total_slices = total_slices(no_pizzas, slices_per_pizza)
    slices_pp = slices_per_person(total_slices, no_people)
    remaining = leftover_pizza(total_slices, no_people)

    IO.puts "#{no_people} people with #{no_pizzas} pizzas"
    IO.puts output_pizzas(slices_pp)
    IO.puts output_leftovers(remaining)
    
  end

  def pizzas_needed_for(total_slices, slices_per_pizza ) do
    total_slices / slices_per_pizza
                    |> Float.ceil
                    |> round 
  end 

  def pizza_party_variant() do
    no_people = get_input("How many people? ")
    no_slices_wanted = get_input("How many slices per person? ")
    slices_per_pizza = 8

    total_slices_needed = no_slices_wanted * no_people
    pizzas_needed = pizzas_needed_for(total_slices_needed, slices_per_pizza)

    IO.puts "For #{no_people} people wanting #{no_slices_wanted} slices each, we need to get #{pizzas_needed} pizzas"
  end
end
