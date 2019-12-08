defmodule JBB.Calendar.CalendarEvent do
  use Ecto.Schema
  import Ecto.Changeset
  alias JBB.Calendar
  alias JBB.Calendar.CalendarEventStatus
  @derive {Jason.Encoder, only: [:id, :name, :start, :end, :calendar_event_status]}

  schema "calendar_events" do
    field :end, :utc_datetime
    field :name, :string
    field :start, :utc_datetime
    belongs_to :calendar_event_status, CalendarEventStatus

    timestamps()
  end

  def set_default_status(%{calendar_event_status: _} = event), do: event

  def set_default_status(event) do
    status = Calendar.get_calendar_event_status_by_name!("Draft")

    event
    |> put_assoc(:calendar_event_status, status)
  end

  @doc false
  def changeset(calendar_event, attrs) do
    calendar_event
    |> cast(attrs, [:name, :start, :end, :calendar_event_status_id])
    |> validate_required([:name, :start, :end])
  end
end
