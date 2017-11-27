defmodule CurrencyTest do
  use ExUnit.Case

  test "should convert currency based on rate" do
    assert Currency.convert_currency(81, 137.51) == 111.38
  end

end
