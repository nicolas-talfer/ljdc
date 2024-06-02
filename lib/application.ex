defmodule LJDC.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Ljdc.Worker.start_link(arg)
      # {Ljdc.Worker, arg}
      LJDC.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LJDC.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
