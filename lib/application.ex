defmodule Chat.Application do
  use Application

  require Logger

  def start(type, _args) do
    children = [
      {Chat.Registry, []}
    ]

    opts = [strategy: :one_for_one, name: {:global, __MODULE__}]

    case type do
      :normal ->
        Logger.info("Application is started on #{node()}")

      {:takeover, old_node} ->
        Logger.info("Application is taking over from #{old_node} to #{node()}")

      {:failover, old_node} ->
        Logger.info("Appliction is failing over from #{old_node} to #{node()}")
    end

    Supervisor.start_link(children, opts)
  end
end
