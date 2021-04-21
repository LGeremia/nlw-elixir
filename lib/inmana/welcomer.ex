defmodule Inmana.Welcomer do
  def welcome(params) do
    age = params["age"] |> String.to_integer()
    params["name"]
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end
  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end
  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end
  defp evaluate(name,age) do
    {:error, "You aren't welcome!"}
  end
end
