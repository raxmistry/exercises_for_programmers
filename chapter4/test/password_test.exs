defmodule PasswordTest do
 use ExUnit.Case 

  test "should check password against known user password - john" do
    assert Password.check_password("john", "abc$123") == true
  end 

  test "should check password against known user password - bob" do
    assert Password.check_password("bob", "xxx123") == true
  end 
end
