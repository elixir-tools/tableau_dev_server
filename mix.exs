defmodule TableauDevServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :tableau_dev_server,
      version: "0.0.1",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :inets],
      mod: {TableauDevServer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 1.0"},
      {:web_dev_utils, "~> 0.3"},
      {:websock_adapter, "~> 0.5"},

      # dev
      {:styler, "~> 1.0", only: :dev}
    ]
  end
end
