defmodule Chapter2Test do
  use ExUnit.Case
  doctest Chapter2

  test "greet a person" do
    assert Chapter2.hello("Brian") == "Hello, Brian, nice to meet you!"
  end

  test "count chars in string" do
    assert Chapter2.count_chars("Homer") == "Homer has 5 characters."
  end

end
