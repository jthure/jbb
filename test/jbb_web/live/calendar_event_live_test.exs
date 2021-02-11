defmodule JBBWeb.CalendarEventLiveTest do
  use JBBWeb.ConnCase

  import Phoenix.LiveViewTest

  alias JBB.Calendar

  @create_attrs %{end: "2010-04-17T14:00:00Z", start: "2010-04-17T14:00:00Z", title: "some title"}
  @update_attrs %{end: "2011-05-18T15:01:01Z", start: "2011-05-18T15:01:01Z", title: "some updated title"}
  @invalid_attrs %{end: nil, start: nil, title: nil}

  defp fixture(:calendar_event) do
    {:ok, calendar_event} = Calendar.create_calendar_event(@create_attrs)
    calendar_event
  end

  defp create_calendar_event(_) do
    calendar_event = fixture(:calendar_event)
    %{calendar_event: calendar_event}
  end

  describe "Index" do
    setup [:create_calendar_event]

    test "lists all calendar_events", %{conn: conn, calendar_event: calendar_event} do
      {:ok, _index_live, html} = live(conn, Routes.calendar_event_index_path(conn, :index))

      assert html =~ "Listing Calendar events"
      assert html =~ calendar_event.title
    end

    test "saves new calendar_event", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_index_path(conn, :index))

      assert index_live |> element("a", "New Calendar event") |> render_click() =~
               "New Calendar event"

      assert_patch(index_live, Routes.calendar_event_index_path(conn, :new))

      assert index_live
             |> form("#calendar_event-form", calendar_event: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#calendar_event-form", calendar_event: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_index_path(conn, :index))

      assert html =~ "Calendar event created successfully"
      assert html =~ "some title"
    end

    test "updates calendar_event in listing", %{conn: conn, calendar_event: calendar_event} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_index_path(conn, :index))

      assert index_live |> element("#calendar_event-#{calendar_event.id} a", "Edit") |> render_click() =~
               "Edit Calendar event"

      assert_patch(index_live, Routes.calendar_event_index_path(conn, :edit, calendar_event))

      assert index_live
             |> form("#calendar_event-form", calendar_event: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#calendar_event-form", calendar_event: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_index_path(conn, :index))

      assert html =~ "Calendar event updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes calendar_event in listing", %{conn: conn, calendar_event: calendar_event} do
      {:ok, index_live, _html} = live(conn, Routes.calendar_event_index_path(conn, :index))

      assert index_live |> element("#calendar_event-#{calendar_event.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#calendar_event-#{calendar_event.id}")
    end
  end

  describe "Show" do
    setup [:create_calendar_event]

    test "displays calendar_event", %{conn: conn, calendar_event: calendar_event} do
      {:ok, _show_live, html} = live(conn, Routes.calendar_event_show_path(conn, :show, calendar_event))

      assert html =~ "Show Calendar event"
      assert html =~ calendar_event.title
    end

    test "updates calendar_event within modal", %{conn: conn, calendar_event: calendar_event} do
      {:ok, show_live, _html} = live(conn, Routes.calendar_event_show_path(conn, :show, calendar_event))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Calendar event"

      assert_patch(show_live, Routes.calendar_event_show_path(conn, :edit, calendar_event))

      assert show_live
             |> form("#calendar_event-form", calendar_event: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#calendar_event-form", calendar_event: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.calendar_event_show_path(conn, :show, calendar_event))

      assert html =~ "Calendar event updated successfully"
      assert html =~ "some updated title"
    end
  end
end
