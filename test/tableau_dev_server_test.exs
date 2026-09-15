defmodule TableauDevServerTest do
  use ExUnit.Case

  doctest TableauDevServer

  test "greets the world" do
    assert TableauDevServer.hello() == :world
  end
end
