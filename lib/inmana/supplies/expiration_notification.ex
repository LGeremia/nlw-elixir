defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}
  alias Inmana.Mailer

  def send do
    data = GetByExpiration.call()
    data
    |> Task.async_stream(fn {email, supplies} -> send_email(email,supplies) end)
    |> Stream.run()
  end

  defp send_email(email, supplies) do
    email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
  end
end
