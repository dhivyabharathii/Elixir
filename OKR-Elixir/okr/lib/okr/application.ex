defmodule Okr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OkrWeb.Telemetry,
      Okr.Repo,
      {DNSCluster, query: Application.get_env(:okr, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Okr.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Okr.Finch},
      # Start a worker by calling: Okr.Worker.start_link(arg)
      # {Okr.Worker, arg},
      # Start to serve requests, typically the last entry
      OkrWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Okr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OkrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
