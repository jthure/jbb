# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JBB.Repo.insert!(%JBB.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias JBB.{Accounts, Calendar}

Accounts.create_user(%{"name" => "Jonas Thuresson", "username" => "jthure"})

Calendar.create_calendar_event_status(%{"name" => "Draft"})
{:ok, proposed} = Calendar.create_calendar_event_status(%{"name" => "Proposed"})
Calendar.create_calendar_event_status(%{"name" => "Confirmed"})

Calendar.create_calendar_event(%{
  "name" => "Skidresa Sälen",
  "start" => "2019-03-22T06:00:00+0100",
  "end" => "2019-03-25T23:00:00+0100",
  "calendar_event_status_id" => proposed.id
})
