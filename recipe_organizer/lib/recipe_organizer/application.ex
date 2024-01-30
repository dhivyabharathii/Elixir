defmodule RecipeOrganizer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RecipeOrganizerWeb.Telemetry,
      RecipeOrganizer.Repo,
      {DNSCluster, query: Application.get_env(:recipe_organizer, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RecipeOrganizer.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RecipeOrganizer.Finch},
      # Start a worker by calling: RecipeOrganizer.Worker.start_link(arg)
      # {RecipeOrganizer.Worker, arg},
      # Start to serve requests, typically the last entry
      RecipeOrganizerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RecipeOrganizer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RecipeOrganizerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
