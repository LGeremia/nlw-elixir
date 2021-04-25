defmodule Inmana.Supplies.Scheduler do
  use GenServer
  alias Inmana.Supplies.ExpirationNotification

  # Client / Start the scheduling process
  def start_link(__state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()
    schedule_notification()
    {:noreply, state}
  end

  # Schedule email for supplies that are due to expire in the week
  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
  end

  @doc """
  Examples of functions on GenServer.

  # async fn
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # sync fn
  def handle_call({:get, key}, __from, state) do
    {:reply, Map.get(state, key), state}
  end
  """
end
