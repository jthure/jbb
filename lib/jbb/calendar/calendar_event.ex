defmodule JBB.Calendar.CalendarEvent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendar_events" do
    field :end, :utc_datetime
    field :name, :string
    field :start, :utc_datetime
    field :status, :id

    timestamps()
  end

  @doc false
  def changeset(calendar_event, attrs) do
    calendar_event
    |> cast(attrs, [:name, :start, :end])
    |> validate_required([:name, :start, :end])
  end
end
