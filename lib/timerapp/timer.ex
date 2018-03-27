defmodule Timerapp.Timer do

  use GenServer
  require Logger

  def start_link() do
    GenServer.start_link __MODULE__, %{}
  end

  ## Gen server starts here!

  def init(_state) do
    Logger.warn " 1 ============ Start Here! "
    broadcast(30, "Started Timer!!!!")
    schedule_timer(1_000)
    {:ok, 30}
  end

  def handle_info(:update, 0) do
    broadcast 0, "TIMEEEEEEEEE"
    {:noreply, 0}
  end

  def handle_info(:update, time) do
    leftover = time -1
    broadcast leftover, "clock claock"
    schedule_timer(1_000)
    {:no_reply, leftover}
  end

  defp schedule_timer(interval) do
    Process.send_after self(), :update, interval
  end

  defp broadcast(time, response) do
    TimerappWeb.Endpoint.broadcast! "timer:update", "new_time", %{ response:response, time:time,}
  end


end
