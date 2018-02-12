defmodule DemoPoisonJsonWeb.Router do
  use DemoPoisonJsonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DemoPoisonJsonWeb do
    pipe_through :api
  end
end
