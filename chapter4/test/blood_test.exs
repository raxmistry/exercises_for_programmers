defmodule BloodTest do
  use ExUnit.Case

  test "should calculate blood alcohol content for a male" do
    assert Blood.alcohol_content(50, 150, :male, 2) == 2.32
  end
  
  test "should calculate blood alcohol content for a female" do
    assert Blood.alcohol_content(50, 150, :female, 2) == 2.57
  end
end
