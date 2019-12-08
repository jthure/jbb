defmodule JBB.Calendar.CalendarEventStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :id]}

  schema "calendar_event_statuses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(calendar_event_status, attrs) do
    calendar_event_status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
