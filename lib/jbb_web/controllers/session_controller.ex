defmodule JBBWeb.SessionController do
  use JBBWeb, :controller

  alias JBB.{Accounts, Accounts.User, Accounts.Auth}

  def new(conn, _) do
    changeset = Accounts.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    send_resp(conn, 200, IO.inspect(maybe_user))
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Accounts.authenticate_user(username, password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    # This module's full name is Auth.UserManager.Guardian.Plug,
    |> Auth.Plug.sign_out()
    # and the arguments specfied in the Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  # docs are not applicable here

  defp login_reply({:ok, user}, conn) do
    # conn
    # This module's full name is Auth.UserManager.Guardian.Plug,
    {:ok, jwt, _claims} = Auth.encode_and_sign(user)
    # and the arguments specified in the Guardian.Plug.sign_in()
    conn
    |> send_resp(201, IO.inspect(jwt))
  end

  # docs are not applicable here.

  defp login_reply({:error, reason}, conn) do
    conn
    |> send_resp(405, reason)
  end
end
