defmodule Currency do

  import InputValidation


  @rate_dict  %{:EU => 137.51, :ZAR => 6.95}

  def convert_currency(amount, rate) do
    currency_in_cents = amount * 100
    normalised_rate = rate / 100
    (currency_in_cents * normalised_rate
    |> round ) / 100
  end

  def currency_conversion() do

    amount = get_input("How much of currency  are you exchanging? ")
    rate = get_input_currency("What currency are you converting from?")

    amount_to = convert_currency(amount, rate)

    IO.puts "#{amount} euros at an exchange rate of #{rate} is "
    <> "\n"
    <> "#{amount_to} US dollars."
  end

  def get_input_currency(question) do

    currency = IO.gets question
    atom = currency |> String.trim_trailing("\n") |> String.to_atom
    rate = @rate_dict[atom]
    IO.puts "Rate is : #{rate}"
    case rate do
      nil ->
        IO.puts "Please choose a valid currency"
        get_input_currency(question)
      _ ->
        rate
    end
  end
  
end
