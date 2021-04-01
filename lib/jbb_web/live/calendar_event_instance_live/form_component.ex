defmodule JBBWeb.CalendarEventInstanceLive.FormComponent do
  use JBBWeb, :live_component

  alias JBB.Calendar

  @impl true
  def update(%{calendar_event_instance: calendar_event_instance} = assigns, socket) do
    changeset = Calendar.change_calendar_event_instance(calendar_event_instance)
    calendar_events = Calendar.list_calendar_events()
    |> Enum.map(fn c -> {c.title, c.id} end)
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:calendar_events, calendar_events)
    }

  end

  @impl true
  def handle_event("validate", %{"calendar_event_instance" => calendar_event_instance_params}, socket) do
    changeset =
      socket.assigns.calendar_event_instance
      |> Calendar.change_calendar_event_instance(calendar_event_instance_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"calendar_event_instance" => calendar_event_instance_params}, socket) do
    save_calendar_event_instance(socket, socket.assigns.action, calendar_event_instance_params)
  end

  defp save_calendar_event_instance(socket, :edit, calendar_event_instance_params) do
    case Calendar.update_calendar_event_instance(socket.assigns.calendar_event_instance, calendar_event_instance_params) do
      {:ok, _calendar_event_instance} ->
        {:noreply,
         socket
         |> put_flash(:info, "Calendar event instance updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_calendar_event_instance(socket, :new, calendar_event_instance_params) do
    case Calendar.create_calendar_event_instance(calendar_event_instance_params) do
      {:ok, _calendar_event_instance} ->
        {:noreply,
         socket
         |> put_flash(:info, "Calendar event instance created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
