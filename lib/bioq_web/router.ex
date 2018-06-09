defmodule BioqWeb.Router do
  use BioqWeb, :router

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

  scope "/", BioqWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/utils", UtilController, :index
  end

  scope "/utils", BioqWeb do
    pipe_through(:browser)

    get "/rgen", UtilController, :rgen
  end

  # Other scopes may use custom stacks.
  # scope "/api", BioqWeb do
  #   pipe_through :api
  # end
end
