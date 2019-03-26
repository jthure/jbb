defmodule JBB.Repo.Migrations.CreateCalendarEventStatuses do
  use Ecto.Migration

  def change do
    create table(:calendar_event_statuses) do
      add :name, :string

      timestamps()
    end

  end
end
