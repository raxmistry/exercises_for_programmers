defmodule RetireTest do
  use ExUnit.Case

  test "should return number of years to retirement" do
    assert Retire.years_to_retire(25, 65) == 40
  end 
  
  test "should output message when you can already retire" do
    assert Retire.years_to_retire(65, 25) == :ok 
  end 

  test "should return year of retirement" do
    assert Retire.year_of_retirement(2015, 40) == 2055
  end
end
