defmodule TransitTracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :token, :string
    field :favorites, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :token, :favorites])
    |> validate_required([:first_name, :last_name, :email, :token])
  end
end
