defmodule CompoundInterest do
  import InputValidation

  def calc_interest(principal, percentage, years, compound_times) do
    normalised_percentage = percentage / 100

    principal * :math.pow((1 + normalised_percentage / compound_times), (years * compound_times))
    |> Float.ceil(2)
  end

  def compound_interest() do
    principal = get_input "Enter the principal: "
    percentage = get_input_float "Enter the rate of interest: "
    years = get_input "Enter the number of years: "
    compound_rate = get_input "Enter number of times interest is compounded per year: "

    interest = calc_interest(principal, percentage, years, compound_rate)

    IO.puts "R#{principal} invested at #{percentage}% for #{years} years compounded #{compound_rate} times per year is R#{interest |> :erlang.float_to_binary([decimals: 2])}"
  end
end
