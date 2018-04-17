defmodule TransitTrackerWeb.Router do
  use TransitTrackerWeb, :router

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

  scope "/", TransitTrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/feed", PageController, :index
    get "/stop/:stop_id", PageController, :index
  end
  
  scope "/auth", TransitTrackerWeb do
    pipe_through :browser

    get "/google", AuthController, :request
    get "/:provider/callback", AuthController, :new 
  end
  # Other scopes may use custom stacks.
  scope "/api", TransitTrackerWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/routes", RouteController, except: [:new, :edit]
    get "/stops/:route_id", StopController, :get_stops_by_route
    resources "/stops", StopController, except: [:new, :edit]
    resources "/vehicles", VehicleController, except: [:new, :edit]
  end
end
