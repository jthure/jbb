defmodule JBBWeb.CalendarEventStatusControllerTest do
  use JBBWeb.ConnCase

  alias JBB.Calendar
  alias JBB.Calendar.CalendarEventStatus

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:calendar_event_status) do
    {:ok, calendar_event_status} = Calendar.create_calendar_event_status(@create_attrs)
    calendar_event_status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all calendar_event_statuses", %{conn: conn} do
      conn = get(conn, Routes.calendar_event_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create calendar_event_status" do
    test "renders calendar_event_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.calendar_event_status_path(conn, :create), calendar_event_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.calendar_event_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.calendar_event_status_path(conn, :create), calendar_event_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update calendar_event_status" do
    setup [:create_calendar_event_status]

    test "renders calendar_event_status when data is valid", %{conn: conn, calendar_event_status: %CalendarEventStatus{id: id} = calendar_event_status} do
      conn = put(conn, Routes.calendar_event_status_path(conn, :update, calendar_event_status), calendar_event_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.calendar_event_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, calendar_event_status: calendar_event_status} do
      conn = put(conn, Routes.calendar_event_status_path(conn, :update, calendar_event_status), calendar_event_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete calendar_event_status" do
    setup [:create_calendar_event_status]

    test "deletes chosen calendar_event_status", %{conn: conn, calendar_event_status: calendar_event_status} do
      conn = delete(conn, Routes.calendar_event_status_path(conn, :delete, calendar_event_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.calendar_event_status_path(conn, :show, calendar_event_status))
      end
    end
  end

  defp create_calendar_event_status(_) do
    calendar_event_status = fixture(:calendar_event_status)
    {:ok, calendar_event_status: calendar_event_status}
  end
end
