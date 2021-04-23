defmodule Inmana.Supplies.Get do
  alias Ecto.UUID
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    Supply
    case UUID.cast(uuid) do
      :error -> {:error, %{result: "Invalid ID format!", status: :bad_request}}
      {:ok, uuid} -> get_supplies(uuid)
    end
  end

  defp get_supplies(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found!", status: :bad_request}}
      supply -> {:ok, supply}
    end
  end
end
