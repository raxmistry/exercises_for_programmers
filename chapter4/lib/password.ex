defmodule Password do

  @password "abc$123"

  def check_password(password) do
    password == @password
  end

  def password_validation do

    password = (IO.gets "What is the password? ")
               |> String.replace_trailing("\n", "")
    if (check_password(password)) do
      IO.puts "Welcome!"
    else 
      IO.puts "I don't know you"
    end
  end
end
