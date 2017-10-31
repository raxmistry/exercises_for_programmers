defmodule SimpleMathTest do
  use ExUnit.Case
  import SimpleMath
  test "should convert string to number" do
    assert convert_to_number("5") == 5
  end
  
end
