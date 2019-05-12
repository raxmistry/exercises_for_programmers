defmodule PizzaTest do
  use ExUnit.Case

  test "should calc total number of slices" do
    assert Pizza.total_slices(2, 8)  === 16
  end

  test "should return slices per person" do
    assert Pizza.slices_per_person(16, 8)  == 2
  end

  test "should return leftover pizza" do
    assert Pizza.leftover_pizza(11, 5)  == 1
  end

  test "should output pizzas text for many slices" do
    assert Pizza.output_pizzas(2) == "Each person gets 2 pieces of pizza"
  end

  test "should output pizzas text for one slice " do
    assert Pizza.output_pizzas(1) == "Each person gets 1 piece of pizza"
  end

  test "should output remaining text for one slice" do
     assert Pizza.output_leftovers(1) == "There are 1 leftover piece"
  end

  test "should output remaining text for many slices" do
     assert Pizza.output_leftovers(3) == "There are 3 leftover pieces"
  end

  test "should return correct pluralization for 1" do
    assert Pizza.pluralization(1) == "piece"
  end
  
  test "should return correct pluralization for 5" do
    assert Pizza.pluralization(5) == "pieces"
  end

  test "should return number of pizzas needed" do
    assert Pizza.pizzas_needed_for(17, 8) == 3
  end
end
