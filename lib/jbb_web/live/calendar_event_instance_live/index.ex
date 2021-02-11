defmodule JBBWeb.CalendarEventInstanceLive.Index do
  use JBBWeb, :live_view

  alias JBB.Calendar
  alias JBB.Calendar.CalendarEventInstance

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :calendar_event_instance_collection, list_calendar_event_instance())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Calendar event instance")
    |> assign(:calendar_event_instance, Calendar.get_calendar_event_instance!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Calendar event instance")
    |> assign(:calendar_event_instance, %CalendarEventInstance{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Calendar event instance")
    |> assign(:calendar_event_instance, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    calendar_event_instance = Calendar.get_calendar_event_instance!(id)
    {:ok, _} = Calendar.delete_calendar_event_instance(calendar_event_instance)

    {:noreply, assign(socket, :calendar_event_instance_collection, list_calendar_event_instance())}
  end

  defp list_calendar_event_instance do
    Calendar.list_calendar_event_instance()
  end
end
