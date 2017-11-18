defmodule TaxTest do
  use ExUnit.Case

  test "should calculate tax amount" do
    assert Tax.calc_wi_tax(10.00) == 0.55
  end
  
end
