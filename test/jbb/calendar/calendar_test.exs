defmodule JBB.CalendarTest do
  use JBB.DataCase

  alias JBB.Calendar

  describe "calendar_event_statuses" do
    alias JBB.Calendar.CalendarEventStatus

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def calendar_event_status_fixture(attrs \\ %{}) do
      {:ok, calendar_event_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_calendar_event_status()

      calendar_event_status
    end

    test "list_calendar_event_statuses/0 returns all calendar_event_statuses" do
      calendar_event_status = calendar_event_status_fixture()
      assert Calendar.list_calendar_event_statuses() == [calendar_event_status]
    end

    test "get_calendar_event_status!/1 returns the calendar_event_status with given id" do
      calendar_event_status = calendar_event_status_fixture()
      assert Calendar.get_calendar_event_status!(calendar_event_status.id) == calendar_event_status
    end

    test "create_calendar_event_status/1 with valid data creates a calendar_event_status" do
      assert {:ok, %CalendarEventStatus{} = calendar_event_status} = Calendar.create_calendar_event_status(@valid_attrs)
      assert calendar_event_status.name == "some name"
    end

    test "create_calendar_event_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_calendar_event_status(@invalid_attrs)
    end

    test "update_calendar_event_status/2 with valid data updates the calendar_event_status" do
      calendar_event_status = calendar_event_status_fixture()
      assert {:ok, %CalendarEventStatus{} = calendar_event_status} = Calendar.update_calendar_event_status(calendar_event_status, @update_attrs)
      assert calendar_event_status.name == "some updated name"
    end

    test "update_calendar_event_status/2 with invalid data returns error changeset" do
      calendar_event_status = calendar_event_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_calendar_event_status(calendar_event_status, @invalid_attrs)
      assert calendar_event_status == Calendar.get_calendar_event_status!(calendar_event_status.id)
    end

    test "delete_calendar_event_status/1 deletes the calendar_event_status" do
      calendar_event_status = calendar_event_status_fixture()
      assert {:ok, %CalendarEventStatus{}} = Calendar.delete_calendar_event_status(calendar_event_status)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_calendar_event_status!(calendar_event_status.id) end
    end

    test "change_calendar_event_status/1 returns a calendar_event_status changeset" do
      calendar_event_status = calendar_event_status_fixture()
      assert %Ecto.Changeset{} = Calendar.change_calendar_event_status(calendar_event_status)
    end
  end

  describe "calendar_events" do
    alias JBB.Calendar.CalendarEvent

    @valid_attrs %{end: "2010-04-17T14:00:00Z", name: "some name", start: "2010-04-17T14:00:00Z"}
    @update_attrs %{end: "2011-05-18T15:01:01Z", name: "some updated name", start: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{end: nil, name: nil, start: nil}

    def calendar_event_fixture(attrs \\ %{}) do
      {:ok, calendar_event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_calendar_event()

      calendar_event
    end

    test "list_calendar_events/0 returns all calendar_events" do
      calendar_event = calendar_event_fixture()
      assert Calendar.list_calendar_events() == [calendar_event]
    end

    test "get_calendar_event!/1 returns the calendar_event with given id" do
      calendar_event = calendar_event_fixture()
      assert Calendar.get_calendar_event!(calendar_event.id) == calendar_event
    end

    test "create_calendar_event/1 with valid data creates a calendar_event" do
      assert {:ok, %CalendarEvent{} = calendar_event} = Calendar.create_calendar_event(@valid_attrs)
      assert calendar_event.end == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert calendar_event.name == "some name"
      assert calendar_event.start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_calendar_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_calendar_event(@invalid_attrs)
    end

    test "update_calendar_event/2 with valid data updates the calendar_event" do
      calendar_event = calendar_event_fixture()
      assert {:ok, %CalendarEvent{} = calendar_event} = Calendar.update_calendar_event(calendar_event, @update_attrs)
      assert calendar_event.end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert calendar_event.name == "some updated name"
      assert calendar_event.start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_calendar_event/2 with invalid data returns error changeset" do
      calendar_event = calendar_event_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_calendar_event(calendar_event, @invalid_attrs)
      assert calendar_event == Calendar.get_calendar_event!(calendar_event.id)
    end

    test "delete_calendar_event/1 deletes the calendar_event" do
      calendar_event = calendar_event_fixture()
      assert {:ok, %CalendarEvent{}} = Calendar.delete_calendar_event(calendar_event)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_calendar_event!(calendar_event.id) end
    end

    test "change_calendar_event/1 returns a calendar_event changeset" do
      calendar_event = calendar_event_fixture()
      assert %Ecto.Changeset{} = Calendar.change_calendar_event(calendar_event)
    end
  end
end
