defmodule RectangleTest do
  use ExUnit.Case

  test "should calculate area in feet" do
    assert Rectangle.area(15, 20) == 300
  end
  
  test "should convert square feet to meters" do
    assert Rectangle.convert_area(300, :meters) == 27.871
  end

  test "should convert square meters to feet" do
    assert Rectangle.convert_area(27.871, :feet) == 300.001
  end

  test "should return meters when given feet" do
    assert Rectangle.alt_metric(:feet) == :meters
  end
  
  test "should return feet when given meters" do
    assert Rectangle.alt_metric(:meters) == :feet
  end
end
