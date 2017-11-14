defmodule Interest do

  import InputValidation

  def calc_interest(principal, rate, term) do
    normalised_rate = rate / 100
    principal * (1 + normalised_rate * term)
    #|> Float.ceil(2)
  end


  def simple_interest() do
    principal = get_input "Enter the principal: "
    percentage = get_input_float "Enter the rate of interest: "
    years = get_input "Enter the number of years: "

    interest = Interest.calc_interest(principal, percentage, years)

    IO.puts "After #{years} years, at #{percentage}%, the investment will be worth R#{interest |> :erlang.float_to_binary([decimals: 2])}"
  end
end
