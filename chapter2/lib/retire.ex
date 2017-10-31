defmodule Retire do
  
  def years_to_retire(age, retirement_age) when retirement_age > age do
    retirement_age - age
  end

  def years_to_retire(age, retirement_age) when retirement_age < age do
    IO.puts "You can already retire!!"
  end

  def calc_retirement do 
    age_string = IO.gets "What is your current age?"
    retirement_age_string = IO.gets "At what age would you like to retire?"

    {age, _} = Integer.parse(age_string)
    {retirement_age, _} = Integer.parse(retirement_age_string)

    years_to_retire = years_to_retire(age, retirement_age)
    current_year = Date.utc_today.year
    year_of_retirement = year_of_retirement(current_year, years_to_retire)

    output_message(current_year, years_to_retire, year_of_retirement)
  end 

  def year_of_retirement(current_year, years_to_retire) do
    current_year + years_to_retire
  end

  def output_message(current_year, years_to_retire, year_of_retirement) do
    IO.puts "You have #{years_to_retire} left until you can retire."
    IO.puts "Its #{current_year}, so you can retire in #{year_of_retirement}"
  end
end
