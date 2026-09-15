# TableauDevServer

This is a development package for the [Tableau](https://github.com/elixir-tools/tableau) static site generator.

- Live Reload
- File Watching (build when files change)
- Build tool runners (`assets`)

Please see the [documentation](https://hexdocs.pm/tableau_dev_server) for more information.

## Installation


```elixir
def deps do
  [
    {:tableau_dev_server, "~> 1.0", only: [:dev]}
  ]
end
```


