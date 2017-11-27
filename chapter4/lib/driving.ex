defmodule Driving do

  import InputValidation

  @legal_driving_age 16

  def legal_age(age) do
    if (age < @legal_driving_age), do: false, else: true 
  end

  def driving_age do
    age = get_input("What is your age? ")
    legal = legal_age(age)
    not_text = if !legal, do: "not ", else: ""
    IO.puts "Your are #{not_text} old enough to legally drive."
  end
end
