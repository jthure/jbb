defmodule JBBWeb.CalendarEventControllerTest do
  use JBBWeb.ConnCase

  alias JBB.Calendar
  alias JBB.Calendar.CalendarEvent

  @create_attrs %{
    end: "2010-04-17T14:00:00Z",
    name: "some name",
    start: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    end: "2011-05-18T15:01:01Z",
    name: "some updated name",
    start: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{end: nil, name: nil, start: nil}

  def fixture(:calendar_event) do
    {:ok, calendar_event} = Calendar.create_calendar_event(@create_attrs)
    calendar_event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all calendar_events", %{conn: conn} do
      conn = get(conn, Routes.calendar_event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create calendar_event" do
    test "renders calendar_event when data is valid", %{conn: conn} do
      conn = post(conn, Routes.calendar_event_path(conn, :create), calendar_event: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.calendar_event_path(conn, :show, id))

      assert %{
               "id" => id,
               "end" => "2010-04-17T14:00:00Z",
               "name" => "some name",
               "start" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.calendar_event_path(conn, :create), calendar_event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update calendar_event" do
    setup [:create_calendar_event]

    test "renders calendar_event when data is valid", %{conn: conn, calendar_event: %CalendarEvent{id: id} = calendar_event} do
      conn = put(conn, Routes.calendar_event_path(conn, :update, calendar_event), calendar_event: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.calendar_event_path(conn, :show, id))

      assert %{
               "id" => id,
               "end" => "2011-05-18T15:01:01Z",
               "name" => "some updated name",
               "start" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, calendar_event: calendar_event} do
      conn = put(conn, Routes.calendar_event_path(conn, :update, calendar_event), calendar_event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete calendar_event" do
    setup [:create_calendar_event]

    test "deletes chosen calendar_event", %{conn: conn, calendar_event: calendar_event} do
      conn = delete(conn, Routes.calendar_event_path(conn, :delete, calendar_event))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.calendar_event_path(conn, :show, calendar_event))
      end
    end
  end

  defp create_calendar_event(_) do
    calendar_event = fixture(:calendar_event)
    {:ok, calendar_event: calendar_event}
  end
end
