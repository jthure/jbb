defmodule JBB.Calendar do
  @moduledoc """
  The Calendar context.
  """

  import Ecto.Query, warn: false
  alias JBB.Repo

  alias JBB.Calendar.CalendarEventStatus

  @doc """
  Returns the list of calendar_event_statuses.

  ## Examples

      iex> list_calendar_event_statuses()
      [%CalendarEventStatus{}, ...]

  """
  def list_calendar_event_statuses do
    Repo.all(CalendarEventStatus)
  end

  @doc """
  Gets a single calendar_event_status.

  Raises `Ecto.NoResultsError` if the Calendar event status does not exist.

  ## Examples

      iex> get_calendar_event_status!(123)
      %CalendarEventStatus{}

      iex> get_calendar_event_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_calendar_event_status!(id), do: Repo.get!(CalendarEventStatus, id)

  @doc """
  Creates a calendar_event_status.

  ## Examples

      iex> create_calendar_event_status(%{field: value})
      {:ok, %CalendarEventStatus{}}

      iex> create_calendar_event_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_calendar_event_status(attrs \\ %{}) do
    %CalendarEventStatus{}
    |> CalendarEventStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a calendar_event_status.

  ## Examples

      iex> update_calendar_event_status(calendar_event_status, %{field: new_value})
      {:ok, %CalendarEventStatus{}}

      iex> update_calendar_event_status(calendar_event_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_calendar_event_status(%CalendarEventStatus{} = calendar_event_status, attrs) do
    calendar_event_status
    |> CalendarEventStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CalendarEventStatus.

  ## Examples

      iex> delete_calendar_event_status(calendar_event_status)
      {:ok, %CalendarEventStatus{}}

      iex> delete_calendar_event_status(calendar_event_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_calendar_event_status(%CalendarEventStatus{} = calendar_event_status) do
    Repo.delete(calendar_event_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking calendar_event_status changes.

  ## Examples

      iex> change_calendar_event_status(calendar_event_status)
      %Ecto.Changeset{source: %CalendarEventStatus{}}

  """
  def change_calendar_event_status(%CalendarEventStatus{} = calendar_event_status) do
    CalendarEventStatus.changeset(calendar_event_status, %{})
  end

  alias JBB.Calendar.CalendarEvent

  @doc """
  Returns the list of calendar_events.

  ## Examples

      iex> list_calendar_events()
      [%CalendarEvent{}, ...]

  """
  def list_calendar_events do
    from(e in CalendarEvent, preload: [:calendar_event_status])
    |> Repo.all()
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
  def get_calendar_event!(id), do: Repo.get!(CalendarEvent, id)

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
  Deletes a CalendarEvent.

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
      %Ecto.Changeset{source: %CalendarEvent{}}

  """
  def change_calendar_event(%CalendarEvent{} = calendar_event) do
    CalendarEvent.changeset(calendar_event, %{})
  end
end
