defmodule JBBWeb.Router do
  use JBBWeb, :router

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

  pipeline :auth do
    plug JBB.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", JBBWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", JBBWeb do
    pipe_through [:api]
    resources "/calendar_events", CalendarEventController
    resources "/calendar_event_statuses", CalendarEventStatusController, only: [:index, :show]
    resources "/users", UserController

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end
end
