defmodule PaintTest do
  use ExUnit.Case

  test "should calculate area of ceiling" do
    assert Paint.area(30, 50) == 1500
  end

  test "should calculate number of gallons required" do
    assert Paint.gallons_required(360) == 2 
  end

  test "should calculate area of circular room" do
    assert Paint.area(10) == 314
  end
end
