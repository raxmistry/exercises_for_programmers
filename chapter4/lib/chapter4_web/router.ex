defmodule Chapter4Web.Router do
  use Chapter4Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chapter4Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Should rather use a resource and the page should make an ajax call?
  scope "/api/temp", Chapter4Web do
    pipe_through :api

    post "/", TempController, :calc_temp
  end

end
