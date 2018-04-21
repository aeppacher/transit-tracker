defmodule TransitTrackerWeb.Plug do
  import Plug.Conn

  def get_user(conn, _params) do
    user = get_session(conn, :current_user)
    assign(conn, :current_user, user)
  end
end
