defmodule JBB.CalendarTest do
  use JBB.DataCase

  alias JBB.Calendar

  describe "calendar_events" do
    alias JBB.Calendar.CalendarEvent

    @valid_attrs %{end: "2010-04-17T14:00:00Z", start: "2010-04-17T14:00:00Z", title: "some title"}
    @update_attrs %{end: "2011-05-18T15:01:01Z", start: "2011-05-18T15:01:01Z", title: "some updated title"}
    @invalid_attrs %{end: nil, start: nil, title: nil}

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
      assert calendar_event.start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert calendar_event.title == "some title"
    end

    test "create_calendar_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_calendar_event(@invalid_attrs)
    end

    test "update_calendar_event/2 with valid data updates the calendar_event" do
      calendar_event = calendar_event_fixture()
      assert {:ok, %CalendarEvent{} = calendar_event} = Calendar.update_calendar_event(calendar_event, @update_attrs)
      assert calendar_event.end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert calendar_event.start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert calendar_event.title == "some updated title"
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

  describe "calendar_event_instance" do
    alias JBB.Calendar.CalendarEventInstance

    @valid_attrs %{end: "2010-04-17T14:00:00Z", start: "2010-04-17T14:00:00Z"}
    @update_attrs %{end: "2011-05-18T15:01:01Z", start: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{end: nil, start: nil}

    def calendar_event_instance_fixture(attrs \\ %{}) do
      {:ok, calendar_event_instance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_calendar_event_instance()

      calendar_event_instance
    end

    test "list_calendar_event_instance/0 returns all calendar_event_instance" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert Calendar.list_calendar_event_instance() == [calendar_event_instance]
    end

    test "get_calendar_event_instance!/1 returns the calendar_event_instance with given id" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert Calendar.get_calendar_event_instance!(calendar_event_instance.id) == calendar_event_instance
    end

    test "create_calendar_event_instance/1 with valid data creates a calendar_event_instance" do
      assert {:ok, %CalendarEventInstance{} = calendar_event_instance} = Calendar.create_calendar_event_instance(@valid_attrs)
      assert calendar_event_instance.end == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert calendar_event_instance.start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_calendar_event_instance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_calendar_event_instance(@invalid_attrs)
    end

    test "update_calendar_event_instance/2 with valid data updates the calendar_event_instance" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert {:ok, %CalendarEventInstance{} = calendar_event_instance} = Calendar.update_calendar_event_instance(calendar_event_instance, @update_attrs)
      assert calendar_event_instance.end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert calendar_event_instance.start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_calendar_event_instance/2 with invalid data returns error changeset" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_calendar_event_instance(calendar_event_instance, @invalid_attrs)
      assert calendar_event_instance == Calendar.get_calendar_event_instance!(calendar_event_instance.id)
    end

    test "delete_calendar_event_instance/1 deletes the calendar_event_instance" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert {:ok, %CalendarEventInstance{}} = Calendar.delete_calendar_event_instance(calendar_event_instance)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_calendar_event_instance!(calendar_event_instance.id) end
    end

    test "change_calendar_event_instance/1 returns a calendar_event_instance changeset" do
      calendar_event_instance = calendar_event_instance_fixture()
      assert %Ecto.Changeset{} = Calendar.change_calendar_event_instance(calendar_event_instance)
    end
  end
end
