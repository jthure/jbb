defmodule JBBWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `JBBWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, JBBWeb.CalendarEventLive.FormComponent,
        id: @calendar_event.id || :new,
        action: @live_action,
        calendar_event: @calendar_event,
        return_to: Routes.calendar_event_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, JBBWeb.ModalComponent, modal_opts)
  end
end
