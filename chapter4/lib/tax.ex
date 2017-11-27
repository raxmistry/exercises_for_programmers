defmodule Tax do

  import InputValidation
  
  @wi_tax 5.5

  def calc_wi_tax(amount) do 
    new_amount = amount * 100 
              |> round

    new_amount * (@wi_tax / 100) / 100 
    |> Float.round(2)
  end

  def calc_state_tax(amount, state) do
    if (state == "WI" or state == "WISCONSIN") do
      tax = calc_wi_tax(amount)
      IO.puts "The subtotal is $#{amount}"
      IO.puts "The tax is $#{tax}"
      tax
    end
    0
  end

  def tax_calculator() do 

    amount = get_input "What is the order amount? "
    state = IO.gets "What is the state ? "
    state = String.replace_trailing(state, "\n", "")
            |> String.upcase
    tax = calc_state_tax(amount, state)
    IO.puts "The total is $#{amount + tax}"
  end
end
