defmodule Blood do
  import InputValidation
  @male_dist_ratio 0.73
  @female_dist_ratio 0.66
  @driving_alcohol_limit 0.08

  def alcohol_content(amount_of_alcohol, body_weight, gender, hours) do
    dist_ratio = if (gender == :male), do: @male_dist_ratio, else: @female_dist_ratio
    ((amount_of_alcohol * 5.14) / (body_weight * dist_ratio)) - 0.015 * hours
    |> Float.round(2)
  end 

  def get_gender() do
    input = (IO.gets "Enter your gender (m/f)?")
            |> String.replace_trailing("\n", "")
            |> String.upcase

    case input do
      "M" -> 
        :male
      "F" ->
        :female
      _ -> 
        IO.puts "Please enter a valid value."
        get_gender()
    end
  end

  def get_units() do
    input = (IO.gets "Imperial or metric units (i/m)?")
            |> String.replace_trailing("\n", "")
            |> String.upcase

    case input do 
      "M" -> 
        :metric
      "I" ->
        :imperial
      _ ->
        IO.puts "Please enter a valid value."
        get_units()
    end
  end

  def bac() do
    units = get_units()
    input_weight = get_input "Enter your weight"
    weight = if (units == :metric), do: input_weight/2.205, else: input_weight
    gender = get_gender()
    no_of_drinks = get_input "Enter number of drinks?"
    alcohol_per_drink = get_input "Amount of alcohol per drink?"
    hours = get_input "Hours since last drink?"

    norm_alc_per_drink = if (units == :metric), do: alcohol_per_drink/28.4, else: alcohol_per_drink
    total_alcohol = no_of_drinks * norm_alc_per_drink

    bac = alcohol_content(total_alcohol, weight, gender, hours)

    not_text = if (bac > @driving_alcohol_limit), do: "not", else:  ""
    IO.puts "Your BAC is #{bac}"
    IO.puts "It is #{not_text} legal to drive."
  end

end
