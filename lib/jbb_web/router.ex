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

  scope "/", JBBWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", JBBWeb do
    pipe_through :api
    resources "/calendar_events", CalendarEventController
    resources "/calendar_event_status", CalendarEventStatusController, only: [:index, :show]
    resources "/users", UserController
  end
end
