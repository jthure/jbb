defmodule JBBWeb.SessionView do
  use JBBWeb, :view
  alias JBBWeb.SessionView

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    session
  end
end
