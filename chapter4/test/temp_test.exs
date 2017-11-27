defmodule TempTest do
  use ExUnit.Case

  test "should convert fahrenheit to celcius" do
    assert Temp.convert(0, :from_celcius, :to_fahrenheit) == 32 
  end 

  test "should convert celcius to fahrenheit" do
    assert Temp.convert(32, :from_fahrenheit, :to_celcius) == 0
  end

  test "should convert celcius to kelvin" do
    assert Temp.convert(0, :from_celcius, :to_kelvin) == 273.15
  end

  test "should convert fahrenheit to kelvin" do
    assert Temp.convert(32, :from_fahrenheit, :to_kelvin) == 273.15
  end

  test "should convert kelvin to celcius" do
    assert Temp.convert(273.15, :from_kelvin, :to_celcius) == 0
  end

  test "should convert kelvin to fahrenheit" do
    assert Temp.convert(273.15, :from_kelvin, :to_fahrenheit) == 32
  end
end
