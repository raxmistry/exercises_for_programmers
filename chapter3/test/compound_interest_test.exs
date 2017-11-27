defmodule CompoundInterestTest do
  use ExUnit.Case

  test "should calculate compound interest" do
    assert CompoundInterest.calc_interest(1500, 4.3, 6, 4) == 1938.84
  end
end
