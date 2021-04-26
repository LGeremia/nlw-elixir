defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Foo Bar", email: "foo@bar.test"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{name: "Foo Bar", email: "foo@bar.test"}, valid?: true} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "Fo", email: ""}
      expected_response = %{email: ["can't be blank"], name: ["should be at least 3 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
