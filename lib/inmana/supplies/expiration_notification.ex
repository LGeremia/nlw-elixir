defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}
  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()
    Enum.each(data, fn {email, supplies} ->
      email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
