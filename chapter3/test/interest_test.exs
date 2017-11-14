defmodule InterestTest do
  use ExUnit.Case
  
  test "should calculate simple interest" do
    assert Interest.calc_interest(1500, 4.3, 4) == 1758
  end
end
