defmodule JBB.Calendar.CalendarEvent do
  use Ecto.Schema
  import Ecto.Changeset
  alias JBB.Calendar.CalendarEventStatus

  schema "calendar_events" do
    field :end, :utc_datetime
    field :name, :string
    field :start, :utc_datetime
    belongs_to :calendar_event_status, CalendarEventStatus

    timestamps()
  end

  @doc false
  def changeset(calendar_event, attrs) do
    calendar_event
    |> cast(attrs, [:name, :start, :end, :calendar_event_status_id])
    |> validate_required([:name, :start, :end])
  end
end
