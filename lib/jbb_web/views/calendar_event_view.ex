defmodule JBBWeb.CalendarEventView do
  use JBBWeb, :view
  alias JBBWeb.CalendarEventView

  def render("index.json", %{calendar_events: calendar_events}) do
    %{data: render_many(calendar_events, CalendarEventView, "calendar_event.json")}
  end

  def render("show.json", %{calendar_event: calendar_event}) do
    %{data: render_one(calendar_event, CalendarEventView, "calendar_event.json")}
  end

  def render("calendar_event.json", %{calendar_event: calendar_event}) do
    %{id: calendar_event.id,
      name: calendar_event.name,
      start: calendar_event.start,
      end: calendar_event.end}
  end
end
