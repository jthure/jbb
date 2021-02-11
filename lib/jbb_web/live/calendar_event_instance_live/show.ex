defmodule JBBWeb.CalendarEventInstanceLive.Show do
  use JBBWeb, :live_view

  alias JBB.Calendar

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:calendar_event_instance, Calendar.get_calendar_event_instance!(id))}
  end

  defp page_title(:show), do: "Show Calendar event instance"
  defp page_title(:edit), do: "Edit Calendar event instance"
end
