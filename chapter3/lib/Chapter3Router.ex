defmodule Chapter3Router do
  use Plug.Router
  use Plug.Builder

  plug Plug.Static, 
    at: "/", from: :chapter3

  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Hello again")
  get "/test", do: send_resp(conn, 200, Test.hello())
  match _, do: send_resp(conn, 404, "Oops")
  
end
