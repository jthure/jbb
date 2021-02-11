defmodule JBB.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias JBB.Accounts.User

  schema "posts" do
    field :text, :string
    belongs_to :owner, User, foreign_key: :owner_userid

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:text, :owner_userid])
    |> validate_required([:text])
    |> assoc_constraint(:owner)
  end
end
