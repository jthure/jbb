defmodule JBBWeb.CalendarEventStatusView do
  use JBBWeb, :view
  alias JBBWeb.CalendarEventStatusView

  def render("index.json", %{calendar_event_statuses: calendar_event_statuses}) do
    %{data: render_many(calendar_event_statuses, CalendarEventStatusView, "calendar_event_status.json")}
  end

  def render("show.json", %{calendar_event_status: calendar_event_status}) do
    %{data: render_one(calendar_event_status, CalendarEventStatusView, "calendar_event_status.json")}
  end

  def render("calendar_event_status.json", %{calendar_event_status: calendar_event_status}) do
    %{id: calendar_event_status.id,
      name: calendar_event_status.name}
  end
end
