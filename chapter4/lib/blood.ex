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

    case input do
      "m" -> 
        :male
      "f" ->
        :female
      _ -> 
        IO.puts "Please enter a valid value."
        get_gender()
    end
  end

  def get_units(units) do

  end

  def bac() do
    units = get_units "Metric or Imperial (m/i)?"
    weight = get_input "Enter your weight ?"
    gender = get_gender()
    no_of_drinks = get_input "Enter number of drinks?"
    alcohol_per_drink = get_input "Amount of alcohol per drink?"
    hours = get_input "Hours since last drink?"

    total_alcohol = no_of_drinks * alcohol_per_drink

    bac = alcohol_content(total_alcohol, weight, gender, hours)

    not_text = if (bac > @driving_alcohol_limit), do: "not", else: ""
    IO.puts "Your BAC is #{bac}"
    IO.puts "It is #{not_text} legal to drive."
  end

end
