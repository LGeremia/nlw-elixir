defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase
  import Phoenix.View
  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Foo Bar", email: "foo@bar.test"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
        message: "Restaurant created!",
        restaurant: %Restaurant{
          email: "foo@bar.test",
          id: _id,
          name: "Foo Bar"
        }
      } = response
    end
  end
end
