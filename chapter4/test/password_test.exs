defmodule PasswordTest do
 use ExUnit.Case 


  test "should check password against known password" do
    assert Password.check_password("abc$123") == true
  end 
end
