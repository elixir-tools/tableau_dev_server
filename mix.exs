defmodule TableauDevServer.MixProject do
  use Mix.Project

  @source_url "https://github.com/elixir-tools/tableau_dev_server"
  def project do
    [
      app: :tableau_dev_server,
      version: "0.0.1",
      description: "Development server for Tableau",
      source_url: @source_url,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs()
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
      {:styler, "~> 1.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Mitchell Hanberg"],
      licenses: ["MIT"],
      links: %{
        GitHub: @source_url,
        Sponsor: "https://github.com/sponsors/mhanberg"
      },
      files: ~w(lib LICENSE mix.exs README.md .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "TableauDevServer",
      extras: [
        "README.md"
      ]
    ]
  end
end
