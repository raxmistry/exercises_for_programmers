defmodule SelfCheckout do
  import InputValidation

  @tax_rate 5.5

  def line_cost(item_cost, no_of_items) do
    item_cost * no_of_items
  end

  def subtotal(items) do
    if (Enum.count(items) == 1) do
      List.first(items)
    else
      [head | tail] = items
      subtotal([head]) + subtotal(tail)
    end
  end

  def calc_tax(subtotal) do
    subtotal * @tax_rate / 100
    |> Float.round(2)
  end

  def get_items(count) do

    if (count == 3) do 
      []
    else
      {price, no_items} = input_items()
      total_price = price * no_items
      [total_price | get_items(count+1)]
    end
  end

  def input_items() do
      price = get_input("Enter price of item? ")
      no_items = get_input("Enter number of items? ")
      {price, no_items}
  end

  def self_checkout() do
    items = get_items(0)
    subtotal = subtotal(items)
    tax = calc_tax(subtotal)

    IO.puts "Subtotal: $#{subtotal}"
    IO.puts "Tax: $#{tax}"
    IO.puts "Total: $#{tax + subtotal}"
  end
end
