defmodule LiveVueSsrIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveVueSsrIssueWeb.Telemetry,
      LiveVueSsrIssue.Repo,
      {DNSCluster, query: Application.get_env(:live_vue_ssr_issue, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveVueSsrIssue.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveVueSsrIssue.Finch},
      # Start a worker by calling: LiveVueSsrIssue.Worker.start_link(arg)
      # {LiveVueSsrIssue.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveVueSsrIssueWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveVueSsrIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveVueSsrIssueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
