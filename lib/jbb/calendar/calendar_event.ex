defmodule JBB.Calendar.CalendarEvent do
  use Ecto.Schema
  import Ecto.Changeset

  alias JBB.Accounts.User

  schema "calendar_events" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    field :title, :string
    belongs_to :owner, User, foreign_key: :owner_userid

    timestamps()
  end

  @doc false
  def changeset(calendar_event, attrs) do
    calendar_event
    |> cast(attrs, [:title, :start, :end, :owner_userid])
    |> validate_required([:title, :start, :end])
    |> assoc_constraint(:owner)
  end
end
