defmodule Password do

  @password "abc$123"
  @user_passwords %{"bob" => "xxx123", "john" => "abc$123"}

  def check_password(user, password) do
    password == @user_passwords[user]
  end

  def password_validation do

    user = (IO.gets "What is the user? ") 
           |> String.replace_trailing("\n", "")
    password = (IO.gets "What is the password? ")
               |> String.replace_trailing("\n", "")
    if (check_password(user, password)) do
      IO.puts "Welcome!"
    else 
      IO.puts "I don't know you"
    end
  end
end
