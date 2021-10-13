defmodule Chat do
  alias Chat.Registry

  def register(nick) do
    with {:ok, pid} <- start_link(),
         {:ok} <- Registry.register(nick, pid) do
      {:ok, "Successfully registered"}
    end
  end

  def send_message(nick, message) do
    with {:ok, pid} <- Registry.get_pid_from_nick(nick),
         send(pid, {:msg, message}) do
      {:ok, "Message sent to #{nick}"}
    end
  end

  defp start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(command) do
    receive do
      {:msg, message} ->
        IO.puts(message)
        loop(command)

      _ ->
        IO.puts("No handled message")
        loop(command)
    end
  end
end
