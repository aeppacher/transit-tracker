defmodule TransitTrackerWeb.Router do
  use TransitTrackerWeb, :router
  import TransitTrackerWeb.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_user
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
    get "/route/:route_id", PageController, :index
    get "/favorites", PageController, :index
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
    resources "/stops", StopController, except: [:new, :edit]
    resources "/vehicles", VehicleController, except: [:new, :edit]
    get "/vehicles/route/:route_id", VehicleController, :route
    get "/stops/:route_id", StopController, :get_stops_by_route
    get "/stops/id/:stop_id", StopController, :get_stop_by_stop_id
    get "/routes/id/:route_id", RouteController, :get_route_by_route_id
    get "/stops/favorites/:user_id", StopController, :favorites
  end
end
