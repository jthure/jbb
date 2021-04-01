defmodule JBB.Calendar do
  @moduledoc """
  The Calendar context.
  """

  import Ecto.Query, warn: false
  alias JBB.Repo

  alias JBB.Calendar.{CalendarEvent, CalendarEventInstance}

  @doc """
  Returns the list of calendar_events.

  ## Examples

      iex> list_calendar_events()
      [%CalendarEvent{}, ...]

  """
  def list_calendar_events do
    Repo.all(CalendarEvent)
  end

  @doc """
  Gets a single calendar_event.

  Raises `Ecto.NoResultsError` if the Calendar event does not exist.

  ## Examples

      iex> get_calendar_event!(123)
      %CalendarEvent{}

      iex> get_calendar_event!(456)
      ** (Ecto.NoResultsError)

  """
  def get_calendar_event!(id)do
    Repo.get!(CalendarEvent, id)
    |>Repo.preload(:owner)
    |>Map.update(:owner, nil, fn user -> JBB.Accounts.User.populate_virtual_fields(user) end)
  end

  @doc """
  Creates a calendar_event.

  ## Examples

      iex> create_calendar_event(%{field: value})
      {:ok, %CalendarEvent{}}

      iex> create_calendar_event(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_calendar_event(attrs \\ %{}) do
    %CalendarEvent{}
    |> CalendarEvent.changeset(attrs)
    |> Repo.insert()
  end

  def create_calendar_event(attrs, user_id) do
    attrs
    |> Map.put("owner_userid", user_id)
    |> create_calendar_event()
  end

  @doc """
  Updates a calendar_event.

  ## Examples

      iex> update_calendar_event(calendar_event, %{field: new_value})
      {:ok, %CalendarEvent{}}

      iex> update_calendar_event(calendar_event, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_calendar_event(%CalendarEvent{} = calendar_event, attrs) do
    calendar_event
    |> CalendarEvent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a calendar_event.

  ## Examples

      iex> delete_calendar_event(calendar_event)
      {:ok, %CalendarEvent{}}

      iex> delete_calendar_event(calendar_event)
      {:error, %Ecto.Changeset{}}

  """
  def delete_calendar_event(%CalendarEvent{} = calendar_event) do
    Repo.delete(calendar_event)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking calendar_event changes.

  ## Examples

      iex> change_calendar_event(calendar_event)
      %Ecto.Changeset{data: %CalendarEvent{}}

  """
  def change_calendar_event(%CalendarEvent{} = calendar_event, attrs \\ %{}) do
    CalendarEvent.changeset(calendar_event, attrs)
  end

  alias JBB.Calendar.CalendarEventInstance

  @doc """
  Returns the list of calendar_event_instance.

  ## Examples

      iex> list_calendar_event_instance()
      [%CalendarEventInstance{}, ...]

  """
  def list_calendar_event_instance do
    Repo.all(CalendarEventInstance)
  end

  @doc """
  Gets a single calendar_event_instance.

  Raises `Ecto.NoResultsError` if the Calendar event instance does not exist.

  ## Examples

      iex> get_calendar_event_instance!(123)
      %CalendarEventInstance{}

      iex> get_calendar_event_instance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_calendar_event_instance!(id), do: Repo.get!(CalendarEventInstance, id)

  @doc """
  Creates a calendar_event_instance.

  ## Examples

      iex> create_calendar_event_instance(%{field: value})
      {:ok, %CalendarEventInstance{}}

      iex> create_calendar_event_instance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_calendar_event_instance(attrs \\ %{}) do
    c = %CalendarEventInstance{}
    |> CalendarEventInstance.changeset(attrs)
    |> Repo.insert()
  end

  def create_calendar_event_instance(attrs, user_id) do
    attrs
    |> Map.put("user_id", user_id)
    |> Repo.insert()
  end

  @doc """
  Updates a calendar_event_instance.

  ## Examples

      iex> update_calendar_event_instance(calendar_event_instance, %{field: new_value})
      {:ok, %CalendarEventInstance{}}

      iex> update_calendar_event_instance(calendar_event_instance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_calendar_event_instance(%CalendarEventInstance{} = calendar_event_instance, attrs) do
    calendar_event_instance
    |> CalendarEventInstance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a calendar_event_instance.

  ## Examples

      iex> delete_calendar_event_instance(calendar_event_instance)
      {:ok, %CalendarEventInstance{}}

      iex> delete_calendar_event_instance(calendar_event_instance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_calendar_event_instance(%CalendarEventInstance{} = calendar_event_instance) do
    Repo.delete(calendar_event_instance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking calendar_event_instance changes.

  ## Examples

      iex> change_calendar_event_instance(calendar_event_instance)
      %Ecto.Changeset{data: %CalendarEventInstance{}}

  """
  def change_calendar_event_instance(%CalendarEventInstance{} = calendar_event_instance, attrs \\ %{}) do
    CalendarEventInstance.changeset(calendar_event_instance, attrs)
  end
end
