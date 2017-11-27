defmodule Chapter4Web.PageController do
  use Chapter4Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
