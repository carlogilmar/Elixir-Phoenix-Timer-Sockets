defmodule TimerappWeb.TimerChannel do

  # Channels send and receive messages, broadcasting to subscribers of different topics. The timer channel is going to have two topics, one for updates and one for starting the timer.
  #
  use Phoenix.Channel

  def join("timer:update", _msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_time", msg, socket) do
    push socket, "new_time", msg
    {:noreply, socket}
  end

end
