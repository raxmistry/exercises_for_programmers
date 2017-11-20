defmodule DrivingTest do
  use ExUnit.Case

  test "should return true for legal age" do
    assert Driving.legal_age(20) == true
  end

  test "should return false for under age" do
    assert Driving.legal_age(15) == false
  end

end
