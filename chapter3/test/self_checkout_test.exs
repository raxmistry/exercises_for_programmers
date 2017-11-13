defmodule SelfCheckoutTest do
  use ExUnit.Case

  test "should calculate cost of one item type" do
    assert SelfCheckout.line_cost(10, 3) == 30
  end

  test "should calculate subtotal" do
    assert SelfCheckout.subtotal([15, 20, 5]) == 40
  end

  test "should calculate tax" do
    assert SelfCheckout.calc_tax(64) == 3.52
  end
end
