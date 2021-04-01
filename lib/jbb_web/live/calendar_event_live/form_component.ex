defmodule JBBWeb.CalendarEventLive.FormComponent do
  use JBBWeb, :live_component

  require Logger
  alias JBB.Calendar

  @impl true
  def update(%{calendar_event: calendar_event} = assigns, socket) do
    changeset = Calendar.change_calendar_event(calendar_event)
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"calendar_event" => calendar_event_params}, socket) do
    changeset =
      socket.assigns.calendar_event
      |> Calendar.change_calendar_event(calendar_event_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"calendar_event" => calendar_event_params}, socket) do
    save_calendar_event(socket, socket.assigns.action, calendar_event_params)
  end

  defp save_calendar_event(socket, :edit, calendar_event_params) do
    case Calendar.update_calendar_event(socket.assigns.calendar_event, calendar_event_params) do
      {:ok, _calendar_event} ->
        {:noreply,
         socket
         |> put_flash(:info, "Calendar event updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_calendar_event(socket, :new, calendar_event_params) do
    case Calendar.create_calendar_event(calendar_event_params, socket.assigns.current_user.id) do
      {:ok, _calendar_event} ->
        {:noreply,
         socket
         |> put_flash(:info, "Calendar event created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
