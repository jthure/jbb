defmodule JBBWeb.SessionController do
  use JBBWeb, :controller

  alias JBB.{Accounts, Accounts.User, Accounts.Auth}

  require IEx

  def new(conn, _) do
    changeset = Accounts.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    render(conn, "show.json", session: maybe_user)
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}} = params) do
    Accounts.authenticate_user(username, password)
    |> login_reply(conn)
  end

  @spec logout(Plug.Conn.t(), any) :: Plug.Conn.t()
  def logout(conn, _) do
    conn
    |> Auth.Plug.sign_out()
    |> send_resp(200, "OK")
  end

  # docs are not applicable here

  defp login_reply({:ok, user}, conn) do
    IO.inspect(user)

    conn
    |> Auth.Plug.sign_in(user)
    |> render("show.json", session: user)
  end

  # docs are not applicable here.

  defp login_reply({:error, reason}, conn) do
    conn
    |> send_resp(401, reason)
  end
end
