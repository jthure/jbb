defmodule JBBWeb.CalendarEventLive.Index do
  use JBBWeb, :live_view
  require Logger
  alias JBB.Calendar
  alias JBB.Calendar.CalendarEvent
  alias JBB.Accounts

  @impl true
  def mount(_params, %{"user_id" => user_id} = _session, socket) do
    socket = socket
    |> assign(:current_user, Accounts.get_user!(user_id))
    |> assign(:calendar_events, list_calendar_events())
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    IO.inspect(socket)
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    x = Calendar.get_calendar_event!(id)
    IO.inspect(x)
    socket
    |> assign(:page_title, "Edit Calendar event")
    |> assign(:calendar_event, Calendar.get_calendar_event!(id))
  end

  defp apply_action(socket, :new, _params) do
    IO.inspect(socket)
    socket
    |> assign(:page_title, "New Calendar event")
    |> assign(:calendar_event, %CalendarEvent{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Calendar events")
    |> assign(:calendar_event, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    calendar_event = Calendar.get_calendar_event!(id)
    {:ok, _} = Calendar.delete_calendar_event(calendar_event)

    {:noreply, assign(socket, :calendar_events, list_calendar_events())}
  end

  defp list_calendar_events do
    Calendar.list_calendar_events()
  end
end
