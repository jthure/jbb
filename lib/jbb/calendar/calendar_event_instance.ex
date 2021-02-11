defmodule JBB.Calendar.CalendarEventInstance do
  use Ecto.Schema
  import Ecto.Changeset

  alias JBB.Calendar.{CalendarEvent}
  alias JBB.Accounts.{User}

  schema "calendar_event_instance" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    belongs_to :owner, User, foreign_key: :owner_userid
    belongs_to :calendar_event, CalendarEvent

    timestamps()
  end

  @doc false
  def changeset(calendar_event_instance, attrs) do
    calendar_event_instance
    |> cast(attrs, [:start, :end, :owner_userid, :calendar_event_id])
    |> validate_required([:start, :end, :owner_userid, :calendar_event_id])
    |> assoc_constraint(:calendar_event)
  end
end
