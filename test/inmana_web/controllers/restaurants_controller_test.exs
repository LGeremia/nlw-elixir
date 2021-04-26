defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create /2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Foo Bar", email: "foo@bar.test"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Restaurant created!",
        "restaurant" => %{
          "email" => "foo@bar.test",
          "id" => _id,
          "name" => "Foo Bar"
          }
        } = response
    end

    test "when there are invalid params, returns an errorr", %{conn: conn} do
      params = %{name: "", email: "foobar.test"}

      expected_response = %{"message" => %{"email" => ["has invalid format"],"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
