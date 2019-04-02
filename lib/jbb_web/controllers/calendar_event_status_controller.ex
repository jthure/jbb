defmodule JBBWeb.CalendarEventStatusController do
  use JBBWeb, :controller

  alias JBB.Calendar
  alias JBB.Calendar.CalendarEventStatus

  action_fallback JBBWeb.FallbackController

  def index(conn, _params) do
    calendar_event_statuses = Calendar.list_calendar_event_statuses()
    render(conn, "index.json", calendar_event_statuses: calendar_event_statuses)
  end

  # def create(conn, %{"calendar_event_status" => calendar_event_status_params}) do
  #   with {:ok, %CalendarEventStatus{} = calendar_event_status} <- Calendar.create_calendar_event_status(calendar_event_status_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.calendar_event_status_path(conn, :show, calendar_event_status))
  #     |> render("show.json", calendar_event_status: calendar_event_status)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    calendar_event_status = Calendar.get_calendar_event_status!(id)
    render(conn, "show.json", calendar_event_status: calendar_event_status)
  end

  # def update(conn, %{"id" => id, "calendar_event_status" => calendar_event_status_params}) do
  #   calendar_event_status = Calendar.get_calendar_event_status!(id)

  #   with {:ok, %CalendarEventStatus{} = calendar_event_status} <- Calendar.update_calendar_event_status(calendar_event_status, calendar_event_status_params) do
  #     render(conn, "show.json", calendar_event_status: calendar_event_status)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   calendar_event_status = Calendar.get_calendar_event_status!(id)

  #   with {:ok, %CalendarEventStatus{}} <- Calendar.delete_calendar_event_status(calendar_event_status) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
