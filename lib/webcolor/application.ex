defmodule Webcolor.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: Webcolor.Router, port: 4000},
    ]

    opts = [strategy: :one_for_one, name: Webcolor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
