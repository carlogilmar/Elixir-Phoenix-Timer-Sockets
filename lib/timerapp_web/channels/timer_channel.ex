defmodule TimerappWeb.TimerChannel do

  # Channels send and receive messages, broadcasting to subscribers of different topics. The timer channel is going to have two topics, one for updates and one for starting the timer.
  #
  use Phoenix.Channel

  def join("timer:update", _msg, socket) do
    {:ok, socket}
  end

end
