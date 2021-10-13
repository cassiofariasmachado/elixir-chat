defmodule Chat.Registry do
  use Agent

  @name {:global, __MODULE__}

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def get_pid_from_nick(nick) do
    Agent.get(@name, &get_pid(&1, nick))
  end

  def register(nick, pid) do
    Agent.update(@name, &update_pid(&1, nick, pid))
  end

  defp update_pid(state, nick, pid) do
    Map.put(state, nick, pid)
  end

  defp get_pid(state, nick) do
    case Map.get(state, nick) do
      nil -> {:error, "Nick not registered"}
      pid -> {:ok, pid}
    end
  end
end
