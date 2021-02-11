defmodule JBBWeb.CalendarEventInstanceLiveTest do
  use JBBWeb.ConnCase

  import Phoenix.LiveViewTest

  alias JBB.Calendar

  @create_attrs %{end: "2010-04-17T14:00:00Z", start: "2010-04-17T14:00:00Z"}
  @update_attrs %{end: "2011-05-18T15:01:01Z", start: "2011-05-18T15:01:01Z"}
  @invalid_attrs %{end: nil, start: nil}

  defp fixture(:calendar_event_instance) do
    {:ok, calendar_event_instance} = Calendar.create_calendar_event_instance(@create_attrs)
    calendar_event_instance
  end

  defp create_calendar_event_instance(_) do
    calendar_event_instance = fixture(:calendar_event_instance)
    %{calendar_event_instance: calendar_event_instance}
  end

  describe "Index" do
    setup [:create_calendar_event_instance]

    test "lists all calendar_event_instance", %{conn: conn, calendar_event_instance: calendar_event_instance} do
      {:ok, _index_live, html} = live(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert html =~ "Listing Calendar event instance"
    end

    test "saves new calendar_event_instance", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert index_live |> element("a", "New Calendar event instance") |> render_click() =~
               "New Calendar event instance"

      assert_patch(index_live, Routes.calendar_event_instance_index_path(conn, :new))

      assert index_live
             |> form("#calendar_event_instance-form", calendar_event_instance: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#calendar_event_instance-form", calendar_event_instance: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert html =~ "Calendar event instance created successfully"
    end

    test "updates calendar_event_instance in listing", %{conn: conn, calendar_event_instance: calendar_event_instance} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert index_live |> element("#calendar_event_instance-#{calendar_event_instance.id} a", "Edit") |> render_click() =~
               "Edit Calendar event instance"

      assert_patch(index_live, Routes.calendar_event_instance_index_path(conn, :edit, calendar_event_instance))

      assert index_live
             |> form("#calendar_event_instance-form", calendar_event_instance: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#calendar_event_instance-form", calendar_event_instance: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert html =~ "Calendar event instance updated successfully"
    end

    test "deletes calendar_event_instance in listing", %{conn: conn, calendar_event_instance: calendar_event_instance} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_instance_index_path(conn, :index))

      assert index_live |> element("#calendar_event_instance-#{calendar_event_instance.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#calendar_event_instance-#{calendar_event_instance.id}")
    end
  end

  describe "Show" do
    setup [:create_calendar_event_instance]

    test "displays calendar_event_instance", %{conn: conn, calendar_event_instance: calendar_event_instance} do
      {:ok, _show_live, html} = live(conn, Routes.calendar_event_instance_show_path(conn, :show, calendar_event_instance))

      assert html =~ "Show Calendar event instance"
    end

    test "updates calendar_event_instance within modal", %{conn: conn, calendar_event_instance: calendar_event_instance} do
      {:ok, show_live, _html} = live(conn, Routes.calendar_event_instance_show_path(conn, :show, calendar_event_instance))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Calendar event instance"

      assert_patch(show_live, Routes.calendar_event_instance_show_path(conn, :edit, calendar_event_instance))

      assert show_live
             |> form("#calendar_event_instance-form", calendar_event_instance: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#calendar_event_instance-form", calendar_event_instance: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_instance_show_path(conn, :show, calendar_event_instance))

      assert html =~ "Calendar event instance updated successfully"
    end
  end
end
