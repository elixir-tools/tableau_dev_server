defmodule TableauDevServer do
  @moduledoc ~S'''
  Documentation for `TableauDevServer`.


  ## Build Tools

  You can arbitrarily start other build tools as "watchers". This is inspired by the way Phoenix does it.

  ```elixir
  # config/config.exs

  import Config

  config :tableau, :assets,
    npx: [
      "tailwindcss",
      "-o",
      "_site/css/site.css",
      "--watch"
    ]

  # or if you are using a package similar to the TailwindCSS hex package

  config :tableau, :assets, tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}

  import_config "#{config_env()}.exs"
  ```

  This will start a long running process that will independently build your CSS as it sees files change.

  These are started automatically when you run `mix tableau.server`.

  ## File Watching

  The dev server will open a file watcher and rebuild whenever you change a file that matches the configured patterns.

  ```elixir
  # config/config.exs
  import Config

  config :tableau, :reloader,
    patterns: [
      ~r"lib/layouts/.*.ex",
      ~r"lib/pages/.*.ex",
      ~r"lib/components.ex",
      ~r"_site/.*.css"
    ]
  ```

  ## Live Reload

  The web page will automatically reload when it notices build artifacts have changed (most likely from the file watcher running the build!)

  To add live reload, use the component from `TableauDevServer.live_reload/1` in your root layout.

  ```heex
  <.live_reload :if={{Mix.env() == :dev}}/>
  ```
  '''

  @doc """
  Component to connect to the development server via websocket to broadcast that the page should reload.

  By default, connects to `'ws://' + location.host + '/ws'`.

  See `WebDevUtils.Components.live_reload/1` for configuration options.

  ## Examples

  ```heex
  <.live_reload :if={{Mix.env() == :dev}}/>
  ```
  """
  defdelegate live_reload(assigns), to: WebDevUtils.Components
end
